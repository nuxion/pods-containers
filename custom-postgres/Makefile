export USAGE
.EXPORT_ALL_VARIABLES:
VERSION := $(shell cat VERSION) 
PROJECTNAME := $(shell basename "$(PWD)")
BUILD := $(shell git rev-parse --short HEAD)
DOCKERID = $(shell echo "nuxion")

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
