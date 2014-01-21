#!/bin/bash
# Connect together all the docker containers

# docker run -i -t -d -p 2204:22 -p 9004:9001 -p 8012:8009 \
# -v /vagrant/docker/wildfly/opt/wildfly:/wildfly -e=WILDFLY_BASE_DIR="/wildfly/standalone",WILDFLY_CONFIG_DIR="/wildfly/standalone/configuration" wildfly /bin/bash

# docker run -i -t -d -p 2204:22 -p 9001:9001 -p 8009:8009 \
#  -v /vagrant/docker/wildfly/opt/wildfly:/wildfly -e=WILDFLY_BASE_DIR="/wildfly/standalone" -e=WILDFLY_CONFIG_DIR="/wildfly/standalone/configuration" wildfly

docker run -i -t -d -dns 172.17.42.1 -dns 8.8.8.8 -dns 8.8.4.4 -p 2205:22 -p 8009:8009 -p 9999:9999 \
 -v /vagrant/docker/as7/working:/as7 \
 -e=AS7_LOG_DIR="/as7/standalone/log" \
 -e=AS7_CONFIG_DIR="/as7/standalone/configuration" \
 -e=AS7_MODULE_DIR="/as7/modules" \
 -e=AS7_BASE_DIR="/as7/standalone" as7