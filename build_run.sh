#!/bin/bash
set -x

version=0.1
volume=''

docker build -t ask:${version} .
exist_flag=`docker container ls --all | grep ask_container | wc -l`

if [ '$exist_flag' != 0 ]; then
  docker rm ask_container
fi


if [ '$volume' = '' ]; then
  echo novolume
  docker run -it --name ask_container -p 8000:8000 ask:${version}
else
  docker run -it --name ask_container -p 8000:8000 -v ${volume}:/work ask:${version} julia work/samp_app.jl
fi

