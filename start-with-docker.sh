#!/bin/bash



container_id=$(sudo docker ps -a | grep $1 | awk '{print $1}')

if [ "$container_id" != "" ]; then
  sudo docker stop $container_id
  sudo docker rm $container_id
fi

image_id=$(sudo docker image ls | grep $1 | awk '{print $3}')

if [ "$image_id" != "" ]; then
  sudo docker rmi $image_id
fi

sudo docker build -t $1:test .
sudo docker compose -f ./docker-compose.yml up -d
