FROM dockerfile/java:openjdk-7-jre
MAINTAINER Ray Shih<mnf.shih@gmail.com>

WORKDIR /tmp

# install logstash 1.4.2
RUN curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz
RUN tar zxvf logstash-1.4.2.tar.gz
RUN mv logstash-1.4.2 /opt/logstash
RUN rm -f /tmp/logstash-1.4.2.tar.gz

# install elasticsearch 1.1.1
RUN curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz
RUN tar zxvf elasticsearch-1.1.1.tar.gz
RUN mv elasticsearch-1.1.1 /opt/elasticsearch
ADD ./elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

# run script
ADD ./run.sh /opt/run.sh

WORKDIR /opt
CMD ["./run.sh"]
