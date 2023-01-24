export USAGE
.EXPORT_ALL_VARIABLES:
VERSION := $(shell cat VERSION) 
PROJECTNAME := $(shell basename "$(PWD)")
BUILD := $(shell git rev-parse --short HEAD)
DOCKERID = $(shell echo "nuxion")
LOCAL_REGISTRY=registry.local:5000

debug:
	docker run --rm -e IP_RANGE=192.168.4.0/24 -it ${DOCKERID}/${PROJECTNAME} /bin/sh 

run:
	docker run --rm -e IP_RANGE=192.168.4.0/24 ${DOCKERID}/${PROJECTNAME}

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
