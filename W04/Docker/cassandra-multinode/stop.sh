#1/bin/bash

docker-compose stop
docker stop cassandra-1
docker stop cassandra-2
docker stop cassandra-3
docker rm cassandra-1
docker rm cassandra-2
docker rm cassandra-3