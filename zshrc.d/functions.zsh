#!/bin/zsh

# docker ssh. requires docker and jq
function docker_ssh() {
    ssh root@$(docker inspect $1 | jq '.[0].NetworkSettings.Networks.bridge.IPAddress' --raw-output);
}

# bash from within a docker instance. just pass the docker image name. very basic
function docker_bash() {
    docker run -it --entrypoint /bin/bash $1
}
