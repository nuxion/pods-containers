export USAGE
.EXPORT_ALL_VARIABLES:
VERSION := $(shell git describe --tags) 
PROJECTNAME := $(shell basename "$(PWD)")
BUILD := $(shell git rev-parse --short HEAD)
DOCKERID = $(shell echo "nuxion")

debug:
	docker run --rm -it -e GIT_REPO=https://github.com/nuxion/cloudscripts -v ${PWD}/scripts:/opt/scripts ${DOCKERID}/${PROJECTNAME} bash

build-local:
	docker build . -t ${DOCKERID}/${PROJECTNAME}

build:
	gcloud builds submit --region ${REGION} --tag $(REGISTRY)/${PROJECTNAME}:${VERSION} --ignore-file .gitignore


publish: build-local
	docker tag ${DOCKERID}/${PROJECTNAME} ${DOCKERID}/${PROJECTNAME}:${VERSION}
	docker push ${DOCKERID}/${PROJECTNAME}:${VERSION}
