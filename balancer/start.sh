#!/bin/bash
cd "$(dirname $0)"
docker build -t balancer .
docker run -d -p 443:443 --name balancer balancer
cd -
