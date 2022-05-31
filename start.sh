#!/bin/bash

#docker pull ghcr.io/trivarialthea/dockernginxexample:latest
docker run -d -p 80:80 -p 22:22 --name dockernginxexample ghcr.io/trivarialthea/dockernginxexample
