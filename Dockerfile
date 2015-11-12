FROM alpine:3.2
MAINTAINER jason@slack.io

ENV CONSUL_DISCOVERY_ADDRESS consul-discovery
ENV CONSUL_APPDIR /app
ENV CONSUL_DATADIR /consul-data

RUN apk update && \
    apk upgrade && \
    rm -rf /var/cache/apk/*

RUN adduser -DH consul && mkdir ${CONSUL_APPDIR} && mkdir ${CONSUL_DATADIR}

COPY bin/boot ${CONSUL_APPDIR}/boot
COPY consul ${CONSUL_APPDIR}/consul

RUN chmod 755 ${CONSUL_APPDIR}/boot ${CONSUL_APPDIR}/consul

EXPOSE 8300
EXPOSE 8600

#USER consul
CMD /app/boot
