-- hashtypes smoke test.
-- hashtypes is a type layer: it stores digests and provides text/bytea casts.
-- SHA-256/SHA-512/MD5 are computed with PostgreSQL's built-in hash functions
-- and then stored through the hashtypes types.  There is no core sha1(bytea)
-- function, so the known SHA-1 digest of 'abc' is supplied as the test vector.

CREATE EXTENSION IF NOT EXISTS hashtypes;

DO $$
DECLARE
    sha1_hex   constant text := 'a9993e364706816aba3e25717850c26c9cd0d89d';
    sha256_hex constant text := 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad';
    sha512_hex constant text := 'ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f';
    md5_hex    constant text := '900150983cd24fb0d6963f7d28e17f72';
BEGIN
    IF sha1_hex::sha1::text <> sha1_hex THEN
        RAISE EXCEPTION 'hashtypes: sha1 text round-trip failed';
    END IF;
    IF sha1b(decode(sha1_hex, 'hex'))::text <> sha1_hex THEN
        RAISE EXCEPTION 'hashtypes: sha1 bytea cast failed';
    END IF;

    IF sha256('abc'::bytea)::sha256::text <> sha256_hex THEN
        RAISE EXCEPTION 'hashtypes: sha256 digest mismatch';
    END IF;
    IF sha512('abc'::bytea)::sha512::text <> sha512_hex THEN
        RAISE EXCEPTION 'hashtypes: sha512 digest mismatch';
    END IF;
    IF md5('abc')::md5hash::text <> md5_hex THEN
        RAISE EXCEPTION 'hashtypes: md5 digest mismatch';
    END IF;

    IF '352441c2'::crc32::int4 <> 891568578 THEN
        RAISE EXCEPTION 'hashtypes: crc32 digest mismatch';
    END IF;
END
$$;
