# Use latest alpine image as base
FROM alpine:latest

# Copy needed stuff into container
COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

# Install some packages
RUN apk --no-cache add jq bash curl git npm

# Start action
ENTRYPOINT ["/entrypoint.sh"]
