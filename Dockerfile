FROM dockerfile/java:openjdk-7-jre
MAINTAINER Ray Shih<mnf.shih@gmail.com>

# install nginx (for docker cache
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -y nginx

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
RUN rm -f /tmp/elasticsearch-1.1.1.tar.gz

# install kibana
RUN curl -O https://download.elasticsearch.org/kibana/kibana/kibana-3.0.1.tar.gz
RUN tar zxvf kibana-3.0.1.tar.gz
RUN mkdir -p /var/www && mv kibana-3.0.1 /var/www/kibana
ADD ./kibana_config.js /var/www/kibana/config.js
RUN rm -f /tmp/kibana-3.0.1.tar.gz
ADD ./nginx.conf /etc/nginx/sites-available/default

# run script
ADD ./run.sh /opt/run.sh

WORKDIR /opt
CMD ["./run.sh"]
