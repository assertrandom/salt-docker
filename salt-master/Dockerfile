FROM ubuntu:precise

MAINTAINER Manav Leslie "manav.leslie@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ENV MYPASSWORD password

RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN echo "root:$MYPASSWORD" | chpasswd

RUN apt-get -y install perl
RUN apt-get -y install tar
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install vim
RUN apt-get -y install openjdk-7-jdk
RUN apt-get -y install python

RUN apt-get -y install inetutils-ping


RUN apt-get -y install python-software-properties
RUN add-apt-repository ppa:saltstack/salt
RUN apt-get update
RUN apt-get -y install salt-master

RUN mkdir /apps
RUN mkdir /apps/scripts
RUN mkdir /apps/installs
RUN mkdir /apps/data
RUN chmod 777 -R /apps

VOLUME ["/data"]

ADD http://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new uuid

ADD scripts/startup.sh /apps/scripts/startup.sh
RUN chmod +x /apps/scripts/startup.sh

RUN apt-get -y install python-pip python-dev supervisor

RUN mkdir -p /var/log/supervisor

RUN /bin/echo -e "[supervisord]\nnodaemon=true\n" >/etc/supervisord.conf

RUN apt-get -y install openssh-server

RUN mkdir /var/run/sshd

RUN /usr/sbin/sshd

RUN sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd
RUN /bin/echo -e "LANG=\"en_US.UTF-8\"" > /etc/default/local

# Expose 22 to random ports
EXPOSE 22

# Setup supervisor to start openssh

RUN /bin/echo -e "[program:sshd]\ndirectory=/usr/local\ncommand=/usr/sbin/sshd -D\nautostart=true\nautorestart=true\nredirect_stderr=true\n" >>/etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord","-n"]

EXPOSE 4505
EXPOSE 4506

CMD ["/apps/scripts/startup.sh"]
