# docker-go-carbon

A Docker container for the Golang implementation of Graphite/Carbon server with classic architecture:
Agent -> Cache -> Persister (https://github.com/lomik/go-carbon)

# Status

[![Docker Pulls](https://img.shields.io/docker/pulls/alexandertgtalbot/go-carbon)][hub]
[![Image Size](https://images.microbadger.com/badges/image/alexandertgtalbot/go-carbon.svg)][microbadger]
[![Build Status](https://travis-ci.org/alexandertgtalbot/docker-go-carbon.svg?branch=master)][travis]

[hub]: https://hub.docker.com/repository/docker/alexandertgtalbot/go-carbon
[microbadger]: https://microbadger.com/images/alexandertgtalbot/go-carbon
[travis]: https://travis-ci.org/alexandertgtalbot/docker-go-carbon


# Build

You can use the included Makefile.

To build the Container: `make build`

To remove the builded Docker Image: `make clean`

Starts the Container: `make run`

Starts the Container with Login Shell: `make shell`

Entering the Container: `make exec`

Stop (but **not kill**): `make stop`

History `make history`


# Docker Hub

You can find the Container also at  [DockerHub](https://hub.docker.com/repository/docker/alexandertgtalbot/go-carbon)

## Running the container

    docker pull alexandertgtalbot/go-carbon
    docker run --rm --detach --name alexandertgtalbot-go-carbon --hostname alexandertgtalbot-go-carbon --privileged --publish 2003:2003 --publish 2003:2003/udp --publish 2004:2004 --publish 7002:7002 --publish 7003:7003 --publish 7007:7007 --publish 8080:8080 alexandertgtalbot/go-carbon:latest


# supported Environment Vars

# Ports

 - 2003
 - 2003/udp
 - 2004
 - 7002
 - 7007

## Credited original author

[bodsch](https://github.com/bodsch/docker-go-carbon)
