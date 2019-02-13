#!/usr/bin/env bash

DOCKER_USER=filiperinaldi 

docker build -t ${DOCKER_USER}/test:amd64-latest --build-arg BASE=python:3.5.6-alpine3.8 .
docker build -t ${DOCKER_USER}/test:arm64v8-latest --build-arg BASE=arm64v8/python:3.5.6-alpine3.8 .

docker push ${DOCKER_USER}/test:amd64-latest
docker push ${DOCKER_USER}/test:arm64v8-latest

docker manifest create ${DOCKER_USER}/test:latest ${DOCKER_USER}/test:amd64-latest ${DOCKER_USER}/test:arm64v8-latest

docker manifest annotate ${DOCKER_USER}/test:latest ${DOCKER_USER}/test:arm64v8-latest --os linux --arch arm64 --variant v8

docker manifest push ${DOCKER_USER}/test:latest

