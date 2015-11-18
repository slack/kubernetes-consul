# Consul for Kubernetes

This repo is designed to package up Consul for deployment in a Kubernetes
cluster.

Why Consul in k8s? If you need a CP store for your app, Consul should do the
trick.

Given K8S service discovery and APIs Consul's support for SD and health
checking isn't the primary focus here.

This Docker image is built using a buildroot base image. I would have used
alpine except for the fact that consul requires glibc.

[](http://www.blang.io/posts/2015-04_golang-alpine-build-golang-binaries-for-alpine-linux/)

## Environment

* `CONSUL_DISCOVERY_ADDRESS`: default `consul-server-discovery`
* `CONSUL_APP_DIR`: default `/app`
* `CONSUL_DATA_DIR`: Default: `/consul-data`
* `CONSUL_BOOTSTRAP_SIZE`: Number of nodes to expect before electing a leader. Default: `3`
* `CONSUL_AGENT_MODE`: Required, starts consul in `server` or `client` mode. Default: EXPLODE
* `GOMAXPROCS`: default, `2`

PORTS:
* 8300 HTTP TCP
* 8600 DNS TCP, UDP
