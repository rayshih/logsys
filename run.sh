#!/bin/sh

elasticsearch/bin/elasticsearch &
service nginx start
logstash/bin/logstash -f /etc/opt/logstash.conf
