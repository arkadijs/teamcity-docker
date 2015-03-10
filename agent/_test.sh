#!/bin/sh -xe
tmp=$(mktemp -d)
# port 9090 mapping is optional
docker run -ti --rm --privileged \
    -p 9090:9090 \
    -v $tmp:/data \
    -v $tmp/docker:/var/lib/docker \
    -e TEAMCITY_SERVER=http://192.168.1.2:8111/ \
    -e AGENT_NAME=agent-1 \
    -e STORAGE_DRIVER=aufs \
    -e DOCKER_ARGS="--insecure-registry $DEV_REGISTRY" \
    arkadi/teamcity-agent \
    /sbin/my_init -- bash -l
