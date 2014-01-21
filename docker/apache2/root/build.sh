### Apache

cd /root

echo 'deb http://archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list
apt-get update

# Setup Essentials
apt-get install -y wget vim python-setuptools

# Setup Supervisor
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

# Setup Apache
apt-get -y install apache2-mpm-worker libapache2-mod-jk
useradd -s /bin/bash apache2

# Overwrite default configuration files with our own
echo "Configuration..."
cp -R /root/* /