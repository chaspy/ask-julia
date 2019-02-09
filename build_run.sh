#!/bin/bash
set -x

docker-compose build
docker-compose up --force-recreate
