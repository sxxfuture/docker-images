-- pg_vectorize smoke test (offline initialization/API coverage only).
-- This does not call an embedding provider or schedule a real embedding job.
-- It verifies that the extension and its CASCADE dependencies are installed,
-- that the job table exists, and that the key APIs are registered.

CREATE EXTENSION IF NOT EXISTS vectorize CASCADE;

DO $$
DECLARE
    matches integer;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'vectorize') THEN
        RAISE EXCEPTION 'pg_vectorize: vectorize extension is missing';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'vector') THEN
        RAISE EXCEPTION 'pg_vectorize: vector dependency is missing';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_cron') THEN
        RAISE EXCEPTION 'pg_vectorize: pg_cron dependency is missing';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pgmq') THEN
        RAISE EXCEPTION 'pg_vectorize: pgmq dependency is missing';
    END IF;

    SELECT count(*) INTO matches
      FROM pg_class c
      JOIN pg_namespace n ON n.oid = c.relnamespace
     WHERE n.nspname = 'vectorize'
       AND c.relname = 'job'
       AND c.relkind = 'r';
    IF matches <> 1 THEN
        RAISE EXCEPTION 'pg_vectorize: vectorize.job table is missing';
    END IF;

    SELECT count(*) INTO matches
      FROM information_schema.columns
     WHERE table_schema = 'vectorize'
       AND table_name = 'job'
       AND column_name IN ('job_id', 'name', 'index_dist_type', 'transformer', 'params');
    IF matches <> 5 THEN
        RAISE EXCEPTION 'pg_vectorize: vectorize.job is missing expected columns';
    END IF;

    SELECT count(*) INTO matches
      FROM pg_proc p
      JOIN pg_namespace n ON n.oid = p.pronamespace
     WHERE n.nspname = 'vectorize'
       AND p.proname IN ('table', 'import_embeddings', 'search');
    IF matches < 3 THEN
        RAISE EXCEPTION 'pg_vectorize: one or more key APIs are missing';
    END IF;
END
$$;
