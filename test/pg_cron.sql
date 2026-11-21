-- pg_cron smoke test.
-- The server must be started with pg_cron preloaded and cron.database_name
-- pointing at the test database (postgres by default).  This test only checks
-- scheduling metadata and does not wait for the background scheduler.

CREATE EXTENSION IF NOT EXISTS pg_cron;

DO $$
DECLARE
    job_id bigint;
    job_count integer;
    removed boolean;
BEGIN
    job_id := cron.schedule('smoke-pg-cron', '0 0 1 1 *', 'SELECT 1');
    IF job_id IS NULL THEN
        RAISE EXCEPTION 'pg_cron: schedule did not return a job id';
    END IF;

    SELECT count(*) INTO job_count
      FROM cron.job
     WHERE jobname = 'smoke-pg-cron';
    IF job_count <> 1 THEN
        RAISE EXCEPTION 'pg_cron: expected 1 scheduled job, got %', job_count;
    END IF;

    removed := cron.unschedule('smoke-pg-cron');
    IF NOT removed THEN
        RAISE EXCEPTION 'pg_cron: unschedule returned false';
    END IF;

    SELECT count(*) INTO job_count
      FROM cron.job
     WHERE jobname = 'smoke-pg-cron';
    IF job_count <> 0 THEN
        RAISE EXCEPTION 'pg_cron: job still present after unschedule';
    END IF;
END
$$;
