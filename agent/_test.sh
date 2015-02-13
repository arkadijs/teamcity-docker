#!/bin/sh -xe
tmp=$(mktemp -d)
# port 9090 mapping is optional
docker run -ti --rm \
    -p 9090:9090 \
    -v $tmp:/data \
    -e TEAMCITY_SERVER=http://192.168.1.2:8111/ \
    -e AGENT_NAME=agent-1 \
    arkadi/teamcity-agent \
    /sbin/my_init -- bash -l
