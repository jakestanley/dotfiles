#!/bin/zsh

# docker ssh. requires docker and jq
function docker_ssh() {
    ssh root@$(docker inspect $1 | jq '.[0].NetworkSettings.Networks.bridge.IPAddress' --raw-output);
}