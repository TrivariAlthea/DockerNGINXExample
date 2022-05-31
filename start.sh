#!/bin/bash

docker pull ghcr.io/trivarialthea/dockernginxexample:latest
docker run -d --name dockernginxexample trivarialthea/dockernginxexample
