#!/bin/bash

docker stop $(docker ps -a -q)

docker rm $(docker ps -q -f 'status=exited')
docker volume rm $(docker volume ls -q -f dangling=true)
docker rmi $(docker images -f dangling=true -q)

docker rm $(docker ps -a -q)
docker rmi $(docker images -qa) --force
