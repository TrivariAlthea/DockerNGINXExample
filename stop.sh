#!/bin/bash

docker stop dockernginxexample
docker container rm dockernginxexample 
docker image rm ghcr.io/trivarialthea/dockernginxexample
