-- pg_lease smoke test.
-- pg_lease is pure SQL and has no preload requirement.  A txid-based key keeps
-- the test row independent from other runs and extension tests.

CREATE EXTENSION IF NOT EXISTS pg_lease;

DO $$
DECLARE
    v_key text := 'pg_lease_smoke_' || txid_current()::text;
    v_acquired boolean;
    v_epoch bigint;
    v_expires_at timestamptz;
    v_stored_expires_at timestamptz;
    v_stored_expires_at_2 timestamptz;
    v_status text;
    v_held boolean;
    v_owner text;
    v_inspect_epoch bigint;
BEGIN
    SELECT acquired, epoch, expires_at
      INTO v_acquired, v_epoch, v_expires_at
      FROM lease.acquire(v_key, 'owner-a', interval '1 hour');

    IF NOT v_acquired OR v_epoch <> 1 THEN
        RAISE EXCEPTION 'pg_lease: first acquire returned acquired=% epoch=%', v_acquired, v_epoch;
    END IF;

    SELECT expires_at INTO v_stored_expires_at
      FROM lease.inspect(v_key);

    -- Same owner is idempotent: acquired and epoch stay the same, and the
    -- stored expiry does not move.
    SELECT acquired, epoch
      INTO v_acquired, v_epoch
      FROM lease.acquire(v_key, 'owner-a', interval '1 hour');

    SELECT expires_at INTO v_stored_expires_at_2
      FROM lease.inspect(v_key);

    IF NOT v_acquired OR v_epoch <> 1 THEN
        RAISE EXCEPTION 'pg_lease: same-owner acquire returned acquired=% epoch=%', v_acquired, v_epoch;
    END IF;
    IF v_stored_expires_at_2 <> v_stored_expires_at THEN
        RAISE EXCEPTION 'pg_lease: same-owner acquire changed expiry';
    END IF;

    -- Another owner cannot take an unexpired lease with a non-blocking call.
    SELECT acquired INTO v_acquired
      FROM lease.acquire(v_key, 'owner-b', interval '1 hour');
    IF v_acquired THEN
        RAISE EXCEPTION 'pg_lease: owner-b unexpectedly acquired an active lease';
    END IF;

    SELECT status INTO v_status
      FROM lease.renew(v_key, 'owner-a', 1, interval '1 hour');
    IF v_status <> 'ok' THEN
        RAISE EXCEPTION 'pg_lease: renew returned %', v_status;
    END IF;

    SELECT status INTO v_status
      FROM lease.release(v_key, 'owner-a', 1);
    IF v_status <> 'ok' THEN
        RAISE EXCEPTION 'pg_lease: release returned %', v_status;
    END IF;

    SELECT held, owner, epoch
      INTO v_held, v_owner, v_inspect_epoch
      FROM lease.inspect(v_key);
    IF v_held OR v_owner IS NOT NULL OR v_inspect_epoch <> 2 THEN
        RAISE EXCEPTION 'pg_lease: unexpected free state held=% owner=% epoch=%', v_held, v_owner, v_inspect_epoch;
    END IF;

    -- A free lease can be taken over; the fencing epoch increases to 3.
    SELECT acquired, epoch
      INTO v_acquired, v_epoch
      FROM lease.acquire(v_key, 'owner-b', interval '1 hour');
    IF NOT v_acquired OR v_epoch <> 3 THEN
        RAISE EXCEPTION 'pg_lease: owner-b takeover returned acquired=% epoch=%', v_acquired, v_epoch;
    END IF;

    SELECT held, owner, epoch
      INTO v_held, v_owner, v_inspect_epoch
      FROM lease.inspect(v_key);
    IF NOT v_held OR v_owner <> 'owner-b' OR v_inspect_epoch <> 3 THEN
        RAISE EXCEPTION 'pg_lease: unexpected takeover state held=% owner=% epoch=%', v_held, v_owner, v_inspect_epoch;
    END IF;
END
$$;
