#!/bin/bash

docker exec -it cassandra-1 nodetool status
docker exec -it cassandra-2 nodetool status
docker exec -it cassandra-3 nodetool status