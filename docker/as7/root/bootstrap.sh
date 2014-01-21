#!/bin/bash
export JAVA=/usr/lib/jvm/java-7-oracle/bin/java 
export JAVA_OPTS="-server -Xms64m -Xmx512m -XX:MaxPermSize=256m -XX:+UseCompressedOops"

export AS7_HOME=${AS7_HOME:=/opt/as7}
export AS7_LOG_DIR=${AS7_LOG_DIR:=$AS7_HOME/standalone/log}
export AS7_CONFIG_DIR=${AS7_CONFIG_DIR:=$AS7_HOME/standalone/configuration}
export AS7_MODULE_DIR=${AS7_MODULE_DIR:=$AS7_HOME/modules}
export AS7_BASE_DIR=${AS7_BASE_DIR:=$AS7_HOME/standalone}

/usr/local/bin/supervisord -c /etc/supervisord.conf
