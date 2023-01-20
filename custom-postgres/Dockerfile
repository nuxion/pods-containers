# Based on https://github.com/postgis/docker-postgis/blob/81a0b55/14-3.2/Dockerfile
ARG IMAGE_VER=14.5-bullseye
FROM postgres:${IMAGE_VER}
LABEL name="PostgreSQL Container Images" \
      version="${IMAGE_VER}" \
      summary="PostgreSQL Container images." \
      description="This Docker image contains PostgreSQL and PGBackRest based on Postgres ${IMAGE_VER}."

WORKDIR /workspace
COPY . .
# ca-certificates package is needed for google apis interactions
RUN apt-get update \
      && apt-get install pgbackrest ca-certificates --yes \
      && rm -rf /var/lib/apt/lists/* \
      && cp /workspace/files/postgres.conf /etc/postgresql/postgresql.conf 
