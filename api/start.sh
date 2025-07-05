#!/bin/bash

cd "$(dirname $0)"
docker build --no-cache -t api .

instances=${1:-1}
for (( i=1; i<=$instances; i++ )); do
  host_port=$((442 + ${i}))
  docker run -d -p ${host_port}:443 --name api-${i} api
done

cd -
