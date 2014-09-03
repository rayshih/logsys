#!/bin/sh

elasticsearch/bin/elasticsearch &
logstash/bin/logstash -f /etc/opt/logstash.conf
