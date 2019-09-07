FROM alpine:3.10

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

RUN apk --no-cache add jq bash curl git npm

ENTRYPOINT ["/entrypoint.sh"]
