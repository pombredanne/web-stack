#!/bin/bash
# Connect together all the docker containers

docker run -d -i -t -dns 172.17.42.1 -dns 8.8.8.8 -dns 8.8.4.4 -p 2200:22 -p 8080:80 \
 -v /vagrant/docker/apache2/working:/apache2 \
  -e=APACHE_LOG_DIR="/apache2/log" apache2
