-- pg_tokenizer smoke test.
-- Uses the built-in unicode_segmentation pre-tokenizer and to_lowercase
-- character filter; no model files or API calls are needed.

CREATE EXTENSION IF NOT EXISTS pg_tokenizer;

SELECT tokenizer_catalog.create_text_analyzer(
    'pg_tokenizer_smoke_analyzer',
    $cfg$pre_tokenizer = "unicode_segmentation"
character_filters = ["to_lowercase"]$cfg$
);

CREATE TABLE pg_tokenizer_smoke (
    id integer PRIMARY KEY,
    body text NOT NULL,
    tsv tsvector NOT NULL
);

INSERT INTO pg_tokenizer_smoke (id, body, tsv) VALUES
    (1, 'Cat dog cat',
        tokenizer_catalog.analyze_to_tsvector('Cat dog cat', 'pg_tokenizer_smoke_analyzer')),
    (2, 'Postgres search',
        tokenizer_catalog.analyze_to_tsvector('Postgres search', 'pg_tokenizer_smoke_analyzer')),
    (3, 'Dog only',
        tokenizer_catalog.analyze_to_tsvector('Dog only', 'pg_tokenizer_smoke_analyzer'));

CREATE INDEX pg_tokenizer_smoke_tsv_gin_idx
    ON pg_tokenizer_smoke USING gin (tsv);

DO $$
DECLARE
    tokens text[];
    matches integer;
BEGIN
    tokens := tokenizer_catalog.apply_text_analyzer(
        'Cat dog cat',
        'pg_tokenizer_smoke_analyzer'
    );
    IF tokens <> ARRAY['cat', 'dog', 'cat'] THEN
        RAISE EXCEPTION 'pg_tokenizer: unexpected tokens: %', tokens;
    END IF;

    IF NOT EXISTS (
        SELECT 1
          FROM pg_tokenizer_smoke
         WHERE id = 1
           AND tsv @@ to_tsquery('cat & dog')
    ) THEN
        RAISE EXCEPTION 'pg_tokenizer: expected row 1 to match cat & dog';
    END IF;

    SELECT count(*) INTO matches
      FROM pg_tokenizer_smoke
     WHERE tsv @@ to_tsquery('dog');
    IF matches <> 2 THEN
        RAISE EXCEPTION 'pg_tokenizer: dog matched % rows, expected 2', matches;
    END IF;

    SELECT count(*) INTO matches
      FROM pg_tokenizer_smoke
     WHERE tsv @@ to_tsquery('cat');
    IF matches <> 1 THEN
        RAISE EXCEPTION 'pg_tokenizer: cat matched % rows, expected 1', matches;
    END IF;

    SELECT count(*) INTO matches
      FROM pg_indexes
     WHERE indexname = 'pg_tokenizer_smoke_tsv_gin_idx'
       AND indexdef ILIKE '%USING gin%';
    IF matches <> 1 THEN
        RAISE EXCEPTION 'pg_tokenizer: GIN index was not created';
    END IF;
END
$$;
