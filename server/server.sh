#!/bin/sh -xe

teamcity=/opt/TeamCity
data=/data
logs=$data/logs

PATH=/bin:/usr/bin:/usr/local/bin
USER=teamcity
HOME=/home/teamcity
TEAMCITY_DATA_PATH=$data/teamcity
CATALINA_TMPDIR=$data/tomcat
CATALINA_OPTS="-server -Xmx512m -XX:MaxPermSize=270m -Dlog4j.configuration=$teamcity/conf/teamcity-server-log4j.xml -Dteamcity_logs=$logs -Djsse.enableSNIExtension=false -Djava.awt.headless=true"
export PATH USER HOME TEAMCITY_DATA_PATH CATALINA_TMPDIR CATALINA_OPTS

mkdir -p $TEAMCITY_DATA_PATH $CATALINA_TMPDIR $logs
chown -R $USER:$USER $data
cd $TEAMCITY_DATA_PATH

exec chpst -u $USER:$USER $teamcity/bin/catalina.sh run
