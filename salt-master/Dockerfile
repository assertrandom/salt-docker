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


RUN apt-get -y install python-software-properties
RUN add-apt-repository ppa:saltstack/salt
RUN apt-get update
RUN apt-get -y install salt-master

RUN mkdir /apps
RUN mkdir /apps/scripts
RUN mkdir /apps/installs
RUN chmod 777 -R /apps

ADD scripts/startup.sh /apps/scripts/startup.sh
RUN chmod +x /apps/scripts/startup.sh

CMD ["/apps/scripts/startup.sh"]
