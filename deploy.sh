#!/bin/sh
docker stop my-proxy
docker rm my-proxy
docker rmi my-proxy:latest
docker build -t my-proxy:latest .
docker run -d --name my-proxy --restart always -p 3128:3128 my-proxy:latest
