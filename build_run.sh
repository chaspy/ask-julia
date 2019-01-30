#!/bin/bash

version=0.1
volume=''

#docker build -t ask:0.1 .

if [ $volume = '']; then
  docker run -it --name ask_container -p 8000:8000 ask:${version}
else
  docker run -it --name ask_container -p 8000:8000 -v ${volume}:/work ask:${version}
fi
