-- pg_search / ParadeDB BM25 smoke test.
-- pg_search requires the pg_search library to be preloaded and declares a
-- dependency on the vector extension, so create vector first.

CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS pg_search;

CREATE TABLE pg_search_smoke (
    id integer PRIMARY KEY,
    title text NOT NULL,
    body text NOT NULL
);

INSERT INTO pg_search_smoke (id, title, body) VALUES
    (1, 'Postgres BM25', 'postgres bm25 search'),
    (2, 'Vector',        'vector similarity search'),
    (3, 'Other',         'unrelated text');

CREATE INDEX pg_search_smoke_idx
    ON pg_search_smoke USING paradedb (id, title, body);

DO $$
DECLARE
    v_matches integer;
    v_score real;
    v_snippet text;
BEGIN
    SELECT count(*) INTO v_matches
      FROM pg_search_smoke
     WHERE body ||| 'bm25';
    IF v_matches <> 1 THEN
        RAISE EXCEPTION 'pg_search: ||| bm25 returned % rows, expected 1', v_matches;
    END IF;

    SELECT count(*) INTO v_matches
      FROM pg_search_smoke
     WHERE body &&& 'postgres bm25';
    IF v_matches <> 1 THEN
        RAISE EXCEPTION 'pg_search: &&& postgres bm25 returned % rows, expected 1', v_matches;
    END IF;

    SELECT pdb.score(id), pdb.snippet(body)
      INTO v_score, v_snippet
      FROM pg_search_smoke
     WHERE body ||| 'bm25'
     LIMIT 1;

    IF v_score IS NULL OR v_score <= 0 THEN
        RAISE EXCEPTION 'pg_search: pdb.score returned %', v_score;
    END IF;
    IF v_snippet IS NULL OR position('bm25' in lower(v_snippet)) = 0 THEN
        RAISE EXCEPTION 'pg_search: pdb.snippet did not contain the match: %', v_snippet;
    END IF;

    SELECT count(*) INTO v_matches
      FROM pg_indexes
     WHERE indexname = 'pg_search_smoke_idx'
       AND indexdef ILIKE '%USING paradedb%';
    IF v_matches <> 1 THEN
        RAISE EXCEPTION 'pg_search: paradedb index was not created';
    END IF;
END
$$;
