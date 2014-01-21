#!/bin/bash

export APACHE_CONFIG_DIR=${APACHE_CONFIG_DIR:=/apache2/conf}
export APACHE_ARGS=${APACHE_ARGS:=}
export APACHE_RUN_USER=apache2
export APACHE_RUN_GROUP=apache2
export APACHE_LOG_DIR=${APACHE_LOG_DIR:=/apache2/log}
export APACHE_RUN_DIR=/var/run/apache2$SUFFIX
export APACHE_PID_FILE=/var/run/apache2$SUFFIX.pid
export APACHE_LOCK_DIR=/var/lock/apache2$SUFFIX

/usr/local/bin/supervisord -c /etc/supervisord.conf
