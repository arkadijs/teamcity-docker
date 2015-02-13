#!/bin/sh -xe
tmp=$(mktemp -d)
docker run -ti --rm \
    -p 8111:8111 \
    -v $tmp:/data \
    arkadi/teamcity-server \
    /sbin/my_init -- bash -l
