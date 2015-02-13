#!/bin/sh -xe

agent=/opt/TeamCityAgent
data=/data/teamcity-agent

PATH=/bin:/usr/bin:/usr/local/bin
USER=teamcity
HOME=/home/teamcity
export PATH USER HOME

if test -z "$TEAMCITY_SERVER" -o -z "$AGENT_NAME"; then
    echo "Please set TeamServer address and Agent name with:\n\tdocker -e TEAMCITY_SERVER=http://teamcity.domain.com:8111/ -e AGENT_NAME=agent-1"
    sleep 20
    exit 1
fi

mkdir -p $data/logs $data/work $data/temp $data/system
chown -R $USER:$USER $data
sed -e "s|{{TEAMCITY_SERVER}}|$TEAMCITY_SERVER|" \
    -e "s|{{AGENT_NAME}}|$AGENT_NAME|" < $agent/conf/buildAgent.custom.properties > $agent/conf/buildAgent.properties
chown $USER:$USER $agent/conf/buildAgent.properties

cd $agent/bin
chpst -u $USER:$USER ./agent.sh start
i=0
set +x
while :; do
    sleep 10
    pid=$(pgrep -f 'jetbrains\.buildServer\.agent\.Launcher')
    if ! test -d /proc/$pid; then i=$((i+1)); fi
    test $i -lt 30 || exit 1
done
