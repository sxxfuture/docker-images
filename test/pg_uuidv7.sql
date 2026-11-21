-- pg_uuidv7 smoke test.
-- Verifies UUIDv7 version/variant bits, timestamp round-trip and uniqueness.

CREATE EXTENSION IF NOT EXISTS pg_uuidv7;

DO $$
DECLARE
    ts timestamptz := '2024-01-02 03:04:05.678+00';
    u uuid;
    roundtrip timestamptz;
    generated integer;
    distinct_generated integer;
    valid integer;
BEGIN
    u := uuid_timestamptz_to_v7(ts);
    IF substring(u::text, 15, 1) <> '7' THEN
        RAISE EXCEPTION 'pg_uuidv7: version nibble is not 7: %', u;
    END IF;
    IF substring(u::text, 20, 1) NOT IN ('8', '9', 'a', 'b') THEN
        RAISE EXCEPTION 'pg_uuidv7: variant nibble is invalid: %', u;
    END IF;

    roundtrip := uuid_v7_to_timestamptz(u);
    IF roundtrip <> ts THEN
        RAISE EXCEPTION 'pg_uuidv7: timestamp round-trip mismatch: % <> %', roundtrip, ts;
    END IF;

    SELECT count(*) INTO generated
      FROM (SELECT uuid_generate_v7() FROM generate_series(1, 1000)) AS s;
    IF generated <> 1000 THEN
        RAISE EXCEPTION 'pg_uuidv7: expected 1000 generated UUIDs, got %', generated;
    END IF;

    SELECT count(DISTINCT generated_uuid) INTO distinct_generated
      FROM (SELECT uuid_generate_v7() AS generated_uuid
              FROM generate_series(1, 1000)) AS s;
    IF distinct_generated <> 1000 THEN
        RAISE EXCEPTION 'pg_uuidv7: expected 1000 unique UUIDs, got %', distinct_generated;
    END IF;

    SELECT count(*) INTO valid
      FROM (SELECT uuid_generate_v7() AS generated_uuid
              FROM generate_series(1, 1000)) AS s
     WHERE substring(generated_uuid::text, 15, 1) = '7'
       AND substring(generated_uuid::text, 20, 1) IN ('8', '9', 'a', 'b');
    IF valid <> 1000 THEN
        RAISE EXCEPTION 'pg_uuidv7: % generated UUIDs had invalid version/variant bits', 1000 - valid;
    END IF;
END
$$;
