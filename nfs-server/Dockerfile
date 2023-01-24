# Based on https://github.com/postgis/docker-postgis/blob/81a0b55/14-3.2/Dockerfile
ARG IMAGE_VER=3.17.1
FROM alpine:${IMAGE_VER}
LABEL name="NFS Server" \
      version="${IMAGE_VER}" \
      summary="NFS server to be used in kubernetes" 
# ca-certificates package is needed for google apis interactions
ENV BASE_DIR /srv/nfs
RUN apk add --no-cache nfs-utils bash \
      && mkdir -p ${BASE_DIR} \
      && mkdir -p ${BASE_DIR}/workspace \
      && mkdir -p ${BASE_DIR}/public
COPY run-server.sh /usr/local/bin/run-server.sh
CMD ["run-server.sh"]
