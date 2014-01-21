### MySQL
FROM    ubuntu:12.04

ADD     root/ /root/
RUN     /bin/bash /root/build.sh
ADD     etc/supervisord.conf /etc/supervisord.conf
ADD     etc/mysql/my.cnf /etc/mysql/my.cnf

EXPOSE  22 3306

CMD     ["/bin/bash", "/root/bootstrap.sh"]
