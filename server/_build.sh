#!/bin/sh -xe
v=9.0.2-1
tag=arkadi/teamcity-server
tag2=$DEV_REGISTRY/$tag
docker build -t $tag:$v .
docker tag -f $tag:$v $tag:latest
docker tag -f $tag:$v $tag2:$v
docker push $tag:$v
docker push $tag:latest
docker push $tag2:$v
