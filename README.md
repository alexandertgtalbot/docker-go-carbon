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

Your can use the included Makefile.

To build the Container: `make build`

To remove the builded Docker Image: `make clean`

Starts the Container: `make run`

Starts the Container with Login Shell: `make shell`

Entering the Container: `make exec`

Stop (but **not kill**): `make stop`

History `make history`


# Docker Hub

You can find the Container also at  [DockerHub](https://hub.docker.com/r/bodsch/docker-go-carbon)

## get

    docker pull bodsch/docker-go-carbon


# supported Environment Vars

# Ports

 - 2003
 - 2003/udp
 - 2004
 - 7002
 - 7007

## Credited original author

[bodsch](https://github.com/bodsch/docker-go-carbon)
