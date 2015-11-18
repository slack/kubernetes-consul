FROM quay.io/jhansen/base:0.0.1
MAINTAINER jason@slack.io

ENV CONSUL_DISCOVERY_ADDRESS consul-server-discovery
ENV CONSUL_APP_DIR /app
ENV CONSUL_DATA_DIR /consul-data
ENV CONSUL_BOOTSTRAP_SIZE 3
ENV CONSUL_AGENT_MODE EXPLODE
ENV GOMAXPROCS 2

RUN adduser -DH consul && mkdir ${CONSUL_APP_DIR} && mkdir ${CONSUL_DATA_DIR}

COPY bin/boot ${CONSUL_APP_DIR}/boot
COPY consul ${CONSUL_APP_DIR}/consul

RUN chmod 755 ${CONSUL_APP_DIR}/boot ${CONSUL_APP_DIR}/consul
RUN chown consul:consul ${CONSUL_DATA_DIR}

#USER consul
CMD /app/boot
