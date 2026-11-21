-- vchord smoke test.
-- vchord requires the vchord library to be preloaded and depends on vector.
-- No probes/lists index options are set; defaults are used.

CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS vchord CASCADE;

CREATE TABLE vchord_smoke (
    id integer PRIMARY KEY,
    embedding vector(3) NOT NULL
);

INSERT INTO vchord_smoke (id, embedding) VALUES
    (1, '[1,0,0]'),
    (2, '[0,1,0]'),
    (3, '[0,0,1]'),
    (4, '[0.9,0.1,0]'),
    (5, '[0.5,0.5,0]');

CREATE INDEX vchord_smoke_idx
    ON vchord_smoke USING vchordrq (embedding vector_l2_ops);

DO $$
DECLARE
    nearest_id integer;
    sphere_matches integer;
    index_count integer;
BEGIN
    SELECT id INTO nearest_id
      FROM vchord_smoke
     ORDER BY embedding <-> '[1,0,0]'::vector
     LIMIT 1;
    IF nearest_id <> 1 THEN
        RAISE EXCEPTION 'vchord: unexpected nearest id %', nearest_id;
    END IF;

    SELECT count(*) INTO sphere_matches
      FROM vchord_smoke
     WHERE embedding <<->> sphere('[1,0,0]'::vector, 0.5);
    IF sphere_matches <> 2 THEN
        RAISE EXCEPTION 'vchord: sphere query matched % rows, expected 2', sphere_matches;
    END IF;

    SELECT count(*) INTO index_count
      FROM pg_indexes
     WHERE indexname = 'vchord_smoke_idx'
       AND indexdef ILIKE '%USING vchordrq%';
    IF index_count <> 1 THEN
        RAISE EXCEPTION 'vchord: vchordrq index was not created';
    END IF;
END
$$;
