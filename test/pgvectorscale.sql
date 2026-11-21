-- pgvectorscale / DiskANN smoke test.
-- Only asserts the top-1 result; ANN tie ordering is intentionally not tested.

CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS vectorscale CASCADE;

CREATE TABLE vectorscale_smoke (
    id integer PRIMARY KEY,
    embedding vector(3) NOT NULL,
    labels smallint[] NOT NULL
);

INSERT INTO vectorscale_smoke (id, embedding, labels) VALUES
    (1, '[1,0,0]',   '{1}'),
    (2, '[0,1,0]',   '{2}'),
    (3, '[0,0,1]',   '{1}'),
    (4, '[0.9,0.1,0]', '{1}');

CREATE INDEX vectorscale_smoke_idx
    ON vectorscale_smoke USING diskann (embedding vector_cosine_ops);

DO $$
DECLARE
    nearest_id integer;
    filtered_id integer;
    index_count integer;
BEGIN
    SELECT id INTO nearest_id
      FROM vectorscale_smoke
     ORDER BY embedding <=> '[1,0,0]'::vector
     LIMIT 1;
    IF nearest_id <> 1 THEN
        RAISE EXCEPTION 'vectorscale: unexpected nearest id %', nearest_id;
    END IF;

    SELECT id INTO filtered_id
      FROM vectorscale_smoke
     WHERE labels @> ARRAY[1]::smallint[]
     ORDER BY embedding <=> '[1,0,0]'::vector
     LIMIT 1;
    IF filtered_id <> 1 THEN
        RAISE EXCEPTION 'vectorscale: unexpected label-filtered nearest id %', filtered_id;
    END IF;

    SELECT count(*) INTO index_count
      FROM pg_indexes
     WHERE indexname = 'vectorscale_smoke_idx'
       AND indexdef ILIKE '%USING diskann%';
    IF index_count <> 1 THEN
        RAISE EXCEPTION 'vectorscale: DiskANN index was not created';
    END IF;
END
$$;
