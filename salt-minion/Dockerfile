FROM ubuntu:precise

MAINTAINER Manav Leslie "manav.leslie@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
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
RUN apt-get -y install salt-minion

RUN mkdir /apps
RUN mkdir /apps/scripts
RUN mkdir /apps/installs
RUN mkdir /apps/data
RUN chmod 777 -R /apps

VOLUME ["/data"]

ADD http://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new uuid

ADD scripts/startup.sh /apps/scripts/startup.sh
RUN chmod +x /apps/scripts/startup.sh

EXPOSE 4505
EXPOSE 4506

CMD ["/apps/scripts/startup.sh"]
