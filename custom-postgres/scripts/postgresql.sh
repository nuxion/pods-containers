#!/bin/bash
VERSION=`cat VERSION`
POSTGRES_PASSWORD=${1-meolvide}
IMAGE=nuxion/custom-postgres
docker run --rm --name custom-postgres \
	-e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-p 127.0.0.1:5432:5432  ${IMAGE}:${VERSION}
