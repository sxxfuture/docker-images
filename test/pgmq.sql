-- pgmq smoke test.
-- Covers queue creation, send, read, delete and drop without background jobs.

CREATE EXTENSION IF NOT EXISTS pgmq;

DO $$
DECLARE
    msg_id bigint;
    rec pgmq.message_record;
    queues integer;
BEGIN
    PERFORM pgmq.create('pgmq_smoke');

    SELECT * INTO msg_id
      FROM pgmq.send('pgmq_smoke', '{"hello":"world","n":1}'::jsonb);

    IF msg_id IS NULL OR msg_id <= 0 THEN
        RAISE EXCEPTION 'pgmq: send returned invalid msg_id %', msg_id;
    END IF;

    SELECT * INTO rec
      FROM pgmq.read('pgmq_smoke', 30, 1)
     LIMIT 1;

    IF rec.msg_id IS NULL OR rec.msg_id <> msg_id THEN
        RAISE EXCEPTION 'pgmq: read returned msg_id %, expected %', rec.msg_id, msg_id;
    END IF;
    IF rec.message <> '{"hello":"world","n":1}'::jsonb THEN
        RAISE EXCEPTION 'pgmq: unexpected message payload %', rec.message;
    END IF;

    IF NOT pgmq.delete('pgmq_smoke', msg_id) THEN
        RAISE EXCEPTION 'pgmq: delete returned false';
    END IF;

    IF NOT pgmq.drop_queue('pgmq_smoke') THEN
        RAISE EXCEPTION 'pgmq: drop_queue returned false';
    END IF;

    SELECT count(*) INTO queues
      FROM pgmq.list_queues()
     WHERE queue_name = 'pgmq_smoke';
    IF queues <> 0 THEN
        RAISE EXCEPTION 'pgmq: queue still present after drop_queue';
    END IF;
END
$$;
