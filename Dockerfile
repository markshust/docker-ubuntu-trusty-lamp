FROM ubuntu:14.04
MAINTAINER Mark Shust <mark@shust.com>
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" > /etc/apt/sources.list.d/ondrej-php5-5_6-trusty.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
RUN apt-get update -y
RUN apt-get install -y \
  apache2 \
  mysql-server-5.6 \
  php5 \
  php5-mysql
RUN echo "ServerName 192.168.59.103" >> /etc/apache2/apache2.conf
EXPOSE 80
CMD service apache2 start \
  && service mysql start \
  && /bin/bash
