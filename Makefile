VERSION         ?= latest
IMAGE_REPO      ?= quay.io/jhansen/consul
CONSUL_VERSION  ?= 0.5.2
CONSUL_FILENAME ?= consul_${CONSUL_VERSION}_linux_amd64.zip

.PHONY: all prep clean build tag push clean
all: clean prep build tag push
	echo "Done! ${IMAGE_REPO}:${VERSION}"

prep: clean
	curl -L https://releases.hashicorp.com/consul/${CONSUL_VERSION}/${CONSUL_FILENAME} -o upstream/${CONSUL_FILENAME}
	unzip -d . upstream/${CONSUL_FILENAME}

clean:
	rm -f consul upstream/${CONSUL_FILENAME}

build: clean prep
	docker build -t ${IMAGE_REPO} .

tag:
	docker tag ${IMAGE_REPO} ${IMAGE_REPO}:${VERSION}

push:
	docker push quay.io/jhansen/consul:${VERSION}
