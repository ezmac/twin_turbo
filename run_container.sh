#!/bin/bash

pwd=$(printf '%q\n' "${PWD##*/}")

if [ -z $env ]; then
  echo "PROD"
  #prod
  docker run --name nginx_front -i -t -p 80:80 -p 443:443 -v /data/logs:/data/logs:rw -v /data/containers/nginx_front/config/:/data/config/:rw $pwd
elif [[ $env="dev" ]]; then
  #dev
  echo $env
  docker run --name nginx_front -i -t -p 8088:80  -v `pwd`/logs/:/data/logs/:rw -v `pwd`/config/:/data/config/:rw $pwd
fi

