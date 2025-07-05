#!/bin/bash
for container in $(docker ps -aq --filter "name=^api-"); do
  docker stop $container
  docker rm $container
done
