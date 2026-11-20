-- pgvector smoke test for images built from postgres/Dockerfile.17/18.
-- Executed automatically from /docker-entrypoint-initdb.d during initdb.
-- Keeps its objects so the result can be inspected afterwards.

CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE vector_smoke (
    id integer PRIMARY KEY,
    embedding vector(3) NOT NULL
);

INSERT INTO vector_smoke (id, embedding) VALUES
    (1, '[1,0,0]'),
    (2, '[0,1,0]'),
    (3, '[0,0,1]'),
    (4, '[1,1,0]'),
    (5, '[0.5,0.5,0]');

-- Verify the column actually stores three-dimensional vectors and rejects a
-- wrong-dimension insert.  The expected error is caught in a subtransaction.
DO $$
DECLARE
    row_count integer;
    dim_ok boolean;
    rejected boolean := false;
BEGIN
    SELECT count(*) INTO row_count FROM vector_smoke;
    IF row_count <> 5 THEN
        RAISE EXCEPTION 'vector_smoke: expected 5 rows, got %', row_count;
    END IF;

    SELECT bool_and(vector_dims(embedding) = 3)
      INTO dim_ok
      FROM vector_smoke;
    IF dim_ok IS DISTINCT FROM true THEN
        RAISE EXCEPTION 'vector_smoke: found a vector with unexpected dimensions';
    END IF;

    BEGIN
        INSERT INTO vector_smoke (id, embedding) VALUES (99, '[1,2]');
    EXCEPTION
        WHEN others THEN
            rejected := true;
    END;

    IF NOT rejected THEN
        RAISE EXCEPTION 'vector_smoke: vector(3) accepted a two-dimensional vector';
    END IF;
END
$$;

-- L2 nearest neighbour: the query vector is identical to row 1.
DO $$
DECLARE
    nearest_id integer;
    nearest_distance double precision;
BEGIN
    SELECT id, embedding <-> '[1,0,0]'::vector
      INTO nearest_id, nearest_distance
      FROM vector_smoke
     ORDER BY embedding <-> '[1,0,0]'::vector
     LIMIT 1;

    IF nearest_id <> 1 THEN
        RAISE EXCEPTION 'vector_smoke: unexpected L2 nearest id %, expected 1', nearest_id;
    END IF;
    IF nearest_distance <> 0 THEN
        RAISE EXCEPTION 'vector_smoke: unexpected L2 distance % for identical vectors', nearest_distance;
    END IF;
END
$$;

CREATE INDEX vector_smoke_embedding_hnsw_idx
    ON vector_smoke USING hnsw (embedding vector_l2_ops);

-- Verify the HNSW index exists and the nearest-neighbour query still returns
-- the expected deterministic result.
DO $$
DECLARE
    index_count integer;
    nearest_id integer;
BEGIN
    SELECT count(*)
      INTO index_count
      FROM pg_indexes
     WHERE schemaname = 'public'
       AND tablename = 'vector_smoke'
       AND indexname = 'vector_smoke_embedding_hnsw_idx';

    IF index_count <> 1 THEN
        RAISE EXCEPTION 'vector_smoke: HNSW index was not created';
    END IF;

    SELECT id
      INTO nearest_id
      FROM vector_smoke
     ORDER BY embedding <-> '[0.9,0.1,0]'::vector
     LIMIT 1;

    IF nearest_id <> 1 THEN
        RAISE EXCEPTION 'vector_smoke: unexpected HNSW nearest id %, expected 1', nearest_id;
    END IF;
END
$$;
