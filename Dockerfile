FROM quay.io/jhansen/base:0.0.1
MAINTAINER jason@slack.io

ENV CONSUL_DISCOVERY_ADDRESS consul-server-discovery
ENV CONSUL_APPDIR /app
ENV CONSUL_DATADIR /consul-data
ENV CONSUL_BOOTSTRAP_SIZE 3
ENV CONSUL_AGENT_MODE EXPLODE
ENV GOMAXPROCS=2

RUN adduser -DH consul && mkdir ${CONSUL_APPDIR} && mkdir ${CONSUL_DATADIR}

COPY bin/boot ${CONSUL_APPDIR}/boot
COPY consul ${CONSUL_APPDIR}/consul

RUN chmod 755 ${CONSUL_APPDIR}/boot ${CONSUL_APPDIR}/consul
RUN chown consul:consul ${CONSUL_DATADIR}

EXPOSE 8300
EXPOSE 8600

#USER consul
CMD /app/boot
