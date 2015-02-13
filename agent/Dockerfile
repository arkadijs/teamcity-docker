FROM phusion/baseimage:0.9.16
MAINTAINER Arkadi Shishlov <arkadi.shishlov@gmail.com>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y unzip openjdk-7-jdk \
    && apt-get clean \
    && find /var/lib/apt/lists -type f -delete

ADD buildAgent-9.0.2.zip /tmp/buildAgent.zip
ADD install.sh /tmp/
RUN /tmp/install.sh && rm /tmp/install.sh

ADD buildAgent.properties /opt/TeamCityAgent/conf/buildAgent.custom.properties
ADD agent.sh /etc/service/teamcity-agent/run

#RUN rm -f /etc/service/sshd/down

VOLUME /data
EXPOSE 22 9090
