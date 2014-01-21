### Jenkins
FROM    ubuntu:12.04

ADD     common/ /root/
ADD     root/ /root/
RUN     /bin/bash /root/build.sh

EXPOSE  22 9999 8009
CMD     ["/bin/bash", "/root/bootstrap.sh"]
