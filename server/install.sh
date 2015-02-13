#!/bin/sh -xe

user=teamcity
teamcity=/opt/TeamCity

useradd -r -U -m -s /bin/bash -p '*' -c "TeamCity Server" $user
mkdir -p /opt
wget -qO- http://download.jetbrains.com/teamcity/TeamCity-9.0.2.tar.gz | tar xz -C /opt
ln -s /data/tomcat $teamcity/logs
ln -s /data/tomcat $teamcity/work
chown -Rh $user:$user $teamcity/webapps/ROOT/WEB-INF $teamcity/webapps/ROOT/plugins
