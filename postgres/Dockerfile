ARG PG_MAJOR=17
ARG DEBIAN_CODENAME=trixie

FROM postgres:$PG_MAJOR-$DEBIAN_CODENAME

ADD https://github.com/pgvector/pgvector.git#v0.8.6 /tmp/pgvector
ADD https://github.com/postgis/postgis.git#3.6.4 /tmp/postgis

RUN <<EORUN
#!/bin/bash -ex
apt-get update
apt-mark hold locales

# Install build dependencies
apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    postgresql-server-dev-$PG_MAJOR \
    libxml2-dev \
    libgeos-dev \
    libproj-dev \
    libgdal-dev \
    libjson-c-dev \
    libprotobuf-c-dev \
    protobuf-c-compiler \
    autoconf \
    automake \
    libtool \
    pkg-config

# Build and install pgvector
cd /tmp/pgvector
make clean
make OPTFLAGS=""
make install
mkdir -p /usr/share/doc/pgvector
cp LICENSE README.md /usr/share/doc/pgvector
rm -r /tmp/pgvector

# Build and install PostGIS
cd /tmp/postgis
./autogen.sh
./configure \
    --with-pgconfig=/usr/bin/pg_config \
    --with-geosconfig=/usr/bin/geos-config \
    --with-projdir=/usr \
    --with-gdalconfig=/usr/bin/gdal-config \
    --with-jsondir=/usr \
    --with-protobufdir=/usr
make -j$(nproc)
make install
rm -r /tmp/postgis

# Cleanup
apt-get remove -y \
    build-essential \
    postgresql-server-dev-$PG_MAJOR \
    libxml2-dev \
    libgeos-dev \
    libproj-dev \
    libgdal-dev \
    libjson-c-dev \
    libprotobuf-c-dev \
    protobuf-c-compiler \
    autoconf \
    automake \
    libtool \
    pkg-config
apt-get autoremove -y
apt-mark unhold locales
rm -rf /var/lib/apt/lists/*
EORUN
