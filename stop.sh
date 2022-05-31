#!/bin/bash

docker stop dockernginxexample
docker container rm dockernginxexample 
docker image prune -a
