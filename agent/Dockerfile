FROM phusion/baseimage:0.9.16
MAINTAINER Arkadi Shishlov <arkadi.shishlov@gmail.com>

RUN echo 'deb http://get.docker.io/ubuntu docker main' > /etc/apt/sources.list.d/docker.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y unzip openjdk-7-jdk lxc-docker-1.5.0 apparmor aufs-tools iptables lxc \
    && apt-get clean \
    && find /var/lib/apt/lists -type f -delete

ADD buildAgent-9.0.3.zip /tmp/buildAgent.zip
ADD install.sh /tmp/
RUN /tmp/install.sh && rm /tmp/install.sh

ADD buildAgent.properties /opt/TeamCityAgent/conf/buildAgent.custom.properties
ADD agent.sh /etc/service/teamcity-agent/run
ADD docker.sh /etc/service/docker/run

#RUN rm -f /etc/service/sshd/down

VOLUME /var/lib/docker
VOLUME /data
EXPOSE 22 9090
