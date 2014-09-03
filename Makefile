image = "rayshih/logsys"

build:
	docker build -t ${image} .

bash:
	docker run -it --rm \
		-v ${PWD}/logstash.conf:/etc/opt/logstash.conf \
		-v ${PWD}/data:/mnt/elasticsearch \
		-p 5505:5505 \
		-p 9200:9200 \
		${image} /bin/bash

run:
	docker run -it --rm \
		-v ${PWD}/logstash.conf:/etc/opt/logstash.conf \
		-v ${PWD}/data:/mnt/elasticsearch \
		-p 5505:5505 \
		-p 9200:9200 \
		${image}

