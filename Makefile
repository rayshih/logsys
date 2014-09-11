image = "rayshih/logsys"
PWD = $(shell pwd)

test:
	echo ${PWD}

all: build

build:
	docker build -t ${image} .

bash:
	docker run -it --rm \
		--name logsys \
		-v ${PWD}/logstash.conf:/etc/opt/logstash.conf \
		-v ${PWD}/data:/mnt/elasticsearch \
		-v ${PWD}/kibana.htpasswd:/etc/nginx/conf.d/kibana.htpasswd \
		-p 5505:5505 \
		-p 80:80 \
		${image} /bin/bash

run:
	docker run -it --rm \
		--name logsys \
		-v ${PWD}/logstash.conf:/etc/opt/logstash.conf \
		-v ${PWD}/data:/mnt/elasticsearch \
		-v ${PWD}/kibana.htpasswd:/etc/nginx/conf.d/kibana.htpasswd \
		-p 5505:5505 \
		-p 80:80 \
		${image}

