ARG ALPINE=3.16
ARG GOLANG_TAG=1.19-alpine3.16
FROM golang:${GOLANG_TAG} as builder
RUN apk --no-cache add k3s \
	&& go install github.com/groundcover-com/murre@v0.0.4

FROM alpine:$ALPINE

COPY --from=builder /go/bin/murre /usr/local/bin/
COPY --from=builder /usr/bin/k3s /usr/local/bin/
COPY --from=builder /usr/bin/kubectl /usr/local/bin/

ARG TF_RELEASE=1.1.9
RUN apk --no-cache add bash nmap util-linux wget curl postgresql-client \
	&& mkdir /workspace \
	&& wget https://releases.hashicorp.com/terraform/${TF_RELEASE}/terraform_${TF_RELEASE}_linux_amd64.zip \
	&& unzip terraform_${TF_RELEASE}_linux_amd64.zip \
	&& mv terraform /usr/bin/terraform
WORKDIR /workspace

# ENTRYPOINT ["/bin/bash"]
