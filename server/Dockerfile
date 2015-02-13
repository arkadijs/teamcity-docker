FROM phusion/baseimage:0.9.16
MAINTAINER Arkadi Shishlov <arkadi.shishlov@gmail.com>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget openjdk-7-jre \
    && apt-get clean \
    && find /var/lib/apt/lists -type f -delete

ADD install.sh /tmp/
RUN /tmp/install.sh && rm /tmp/install.sh

ADD server.sh /etc/service/teamcity-server/run

#RUN rm -f /etc/service/sshd/down

VOLUME /data
EXPOSE 22 8111
