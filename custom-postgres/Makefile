export USAGE
.EXPORT_ALL_VARIABLES:
VERSION := $(shell cat VERSION) 
PROJECTNAME := $(shell basename "$(PWD)")
BUILD := $(shell git rev-parse --short HEAD)
DOCKERID = $(shell echo "nuxion")
LOCAL_REGISTRY=registry.local:5000
PG_VER=14.5

debug:
	echo "Not implemented"
	exit 1

build-local:
	docker build . -t ${DOCKERID}/${PROJECTNAME}
	docker tag ${DOCKERID}/${PROJECTNAME} ${DOCKERID}/${PROJECTNAME}:${VERSION}

build:
	gcloud builds submit --region ${REGION} --tag ${REGISTRY}/${PROJECTNAME}:${VERSION} --ignore-file .dockerignore


publish: build-local
	docker tag ${DOCKERID}/${PROJECTNAME} ${DOCKERID}/${PROJECTNAME}:${VERSION}
	docker push ${DOCKERID}/${PROJECTNAME}:${VERSION}

publish-local:
	docker tag ${DOCKERID}/${PROJECTNAME} ${LOCAL_REGISTRY}/${DOCKERID}/${PROJECTNAME}:${VERSION}
	docker push ${LOCAL_REGISTRY}/${DOCKERID}/${PROJECTNAME}:${VERSION}

explore:
	docker run --rm -it -e POSTGRES_PASSWORD=meolvide postgres:${PG_VER}-bullseye bash
