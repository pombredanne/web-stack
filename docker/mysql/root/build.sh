#!/bin/bash

cd /root

echo 'deb http://archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list
apt-get update

# Setup Essentials
apt-get install -y wget vim python-setuptools aptitude

# Setup Supervisor
easy_install supervisor
cp /root/etc/supervisord.conf /etc

# Setup SSH Server
apt-get install -y openssh-server
mkdir -p /var/run/sshd
mkdir -p /root/.ssh
mv id_rsa.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
chown root:root -R /root
echo 'AuthorizedKeysFile  /root/.ssh/authorized_keys' >> /etc/ssh/sshd_config
echo 'PermitRootLogin  without-password' >> /etc/ssh/sshd_config

# Install MySQL
#debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password ""'
#debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password ""'
apt-get -y install mysql-server
