#!/bin/bash

docker rm -f artifact-eval
mkdir RESULTADOS
RESULT_DIR=$(pwd)/RESULTADOS
docker run -d --name artifact-eval --volume $RESULT_DIR:/results taptipalit/temporal-specialization-artifacts:1.0

docker exec -it artifact-eval ./run.sh memcached.libevent

docker exec -it artifact-eval ./run.sh httpd.apr

docker exec -it artifact-eval ./run.sh nginx

docker exec -it artifact-eval ./run.sh lighttpd

docker exec -it artifact-eval ./run.sh redis-server

docker exec -it artifact-eval ./run.sh bind.libuv





