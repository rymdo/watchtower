FROM alpine:3.9 as alpine

RUN apk add --no-cache \
    ca-certificates \
    tzdata \
    wget

FROM busybox
LABEL "com.centurylinklabs.watchtower"="true"

COPY --from=alpine \
    /etc/ssl/certs/ca-certificates.crt \
    /etc/ssl/certs/ca-certificates.crt
COPY --from=alpine \
    /usr/share/zoneinfo \
    /usr/share/zoneinfo
COPY --from=alpine \
    /usr/bin/wget \
    /wget

COPY watchtower /
ENTRYPOINT ["/watchtower"]