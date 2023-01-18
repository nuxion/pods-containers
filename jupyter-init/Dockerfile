FROM alpine:3.16

RUN apk --no-cache add bash git
COPY ./scripts /opt/scripts
WORKDIR /data/workspace
CMD ["/bin/bash"]
