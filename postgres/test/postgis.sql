-- PostGIS smoke test for images built from postgres/Dockerfile.17/18.
-- Executed automatically from /docker-entrypoint-initdb.d during initdb.
-- Keeps its objects so the result can be inspected afterwards.

CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE postgis_smoke (
    id integer PRIMARY KEY,
    name text NOT NULL,
    geom geometry(Point, 4326) NOT NULL
);

INSERT INTO postgis_smoke (id, name, geom) VALUES
    (1, 'origin', ST_SetSRID(ST_MakePoint(0, 0), 4326)),
    (2, 'near',   ST_SetSRID(ST_MakePoint(0.01, 0.01), 4326)),
    (3, 'far',    ST_SetSRID(ST_MakePoint(10, 10), 4326)),
    (4, 'east',   ST_SetSRID(ST_MakePoint(1, 0), 4326));

CREATE INDEX postgis_smoke_geom_gist_idx
    ON postgis_smoke USING gist (geom);

DO $$
DECLARE
    origin_text text;
    origin_srid integer;
    inside_count integer;
    dwithin_count integer;
    nearest_name text;
BEGIN
    SELECT ST_AsText(geom), ST_SRID(geom)
      INTO origin_text, origin_srid
      FROM postgis_smoke
     WHERE id = 1;

    IF origin_text <> 'POINT(0 0)' THEN
        RAISE EXCEPTION 'postgis_smoke: unexpected ST_AsText result: %', origin_text;
    END IF;
    IF origin_srid <> 4326 THEN
        RAISE EXCEPTION 'postgis_smoke: unexpected SRID: %', origin_srid;
    END IF;

    -- The polygon strictly contains origin, near and east; it excludes far.
    SELECT count(*)
      INTO inside_count
      FROM postgis_smoke
     WHERE ST_Contains(
         ST_GeomFromText('POLYGON((-1 -1, 2 -1, 2 2, -1 2, -1 -1))', 4326),
         geom
     );

    IF inside_count <> 3 THEN
        RAISE EXCEPTION 'postgis_smoke: unexpected ST_Contains count: %, expected 3', inside_count;
    END IF;

    -- Distances are in degrees because the geometry column uses SRID 4326.
    SELECT count(*)
      INTO dwithin_count
      FROM postgis_smoke
     WHERE ST_DWithin(
         geom,
         ST_SetSRID(ST_MakePoint(0, 0), 4326),
         0.02
     );

    IF dwithin_count <> 2 THEN
        RAISE EXCEPTION 'postgis_smoke: unexpected ST_DWithin count: %, expected 2', dwithin_count;
    END IF;

    SELECT name
      INTO nearest_name
      FROM postgis_smoke
     ORDER BY geom <-> ST_SetSRID(ST_MakePoint(0.009, 0.009), 4326)
     LIMIT 1;

    IF nearest_name <> 'near' THEN
        RAISE EXCEPTION 'postgis_smoke: unexpected nearest point: %, expected near', nearest_name;
    END IF;
END
$$;

-- Verify the GiST index exists.
DO $$
DECLARE
    index_count integer;
BEGIN
    SELECT count(*)
      INTO index_count
      FROM pg_indexes
     WHERE schemaname = 'public'
       AND tablename = 'postgis_smoke'
       AND indexname = 'postgis_smoke_geom_gist_idx';

    IF index_count <> 1 THEN
        RAISE EXCEPTION 'postgis_smoke: GiST index was not created';
    END IF;
END
$$;
