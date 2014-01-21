#!/bin/bash

cd /root

echo 'deb http://archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list
apt-get update

# Setup Essentials
apt-get install -y wget vim python-setuptools net-tools

# Setup Supervisor
apt-get install -y python-setuptools
easy_install supervisor
mv /root/supervisord.conf /etc

# Setup SSH Server
apt-get install -y openssh-server
mkdir -p /var/run/sshd
mkdir -p /root/.ssh
mv id_rsa.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
chown root:root -R /root
echo 'AuthorizedKeysFile  /root/.ssh/authorized_keys' >> /etc/ssh/sshd_config
echo 'PermitRootLogin  without-password' >> /etc/ssh/sshd_config

# http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
# Setup Oracle Java
apt-get install -y python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get install -y oracle-java7-installer oracle-java7-set-default


# Setup JBoss Application Server 7
INSTALL_DIR=/opt
AS7_AS_FILENAME=jboss-as-7.1.1.Final
AS7_AS_ARCHIVE_NAME=$AS7_AS_FILENAME.tar.gz 
AS7_AS_DOWNLOAD_ADDRESS=http://download.jboss.org/jbossas/7.1/$AS7_AS_FILENAME/$AS7_AS_ARCHIVE_NAME
AS7_AS_FULL_DIR=$INSTALL_DIR/$AS7_AS_FILENAME
AS7_AS_DIR=$INSTALL_DIR/as7
AS7_AS_USER="jboss"
AS7_AS_STARTUP_TIMEOUT=240

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installation..."
wget $AS7_AS_DOWNLOAD_ADDRESS
mkdir $AS7_AS_FULL_DIR
tar -xzf $AS7_AS_ARCHIVE_NAME -C $INSTALL_DIR
mv $AS7_AS_FULL_DIR $AS7_AS_DIR
useradd -s /bin/bash $AS7_AS_USER
chown -R $AS7_AS_USER:$AS7_AS_USER $AS7_AS_DIR
chown -R $AS7_AS_USER:$AS7_AS_USER $AS7_AS_DIR/
rm $AS7_AS_ARCHIVE_NAME

# Overwrite default configuration files with our own
echo "Configuration..."
cp -R /root/* /

echo "Done."

