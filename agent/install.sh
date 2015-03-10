#!/bin/sh -xe

user=teamcity
agent=/opt/TeamCityAgent

useradd -r -U -G docker -m -s /bin/bash -p '*' -c "TeamCity Agent" $user
mkdir -p $agent
unzip /tmp/buildAgent.zip -d $agent
rm /tmp/buildAgent.zip
chmod +x $agent/bin/*.sh
ln -s /data/teamcity-agent/logs $agent/logs
chown -Rh $user:$user $agent
