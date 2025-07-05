#!/bin/bash
for container in $(docker ps -aq --filter "name=^balancer"); do
  docker stop $container
  docker rm $container
done
