#!/bin/zsh

# docker ssh. requires docker and jq
function docker_ssh() {
    ssh root@$(docker inspect $1 | jq '.[0].NetworkSettings.Networks.bridge.IPAddress' --raw-output);
}

# bash from within a docker instance. just pass the docker image name. very basic
function docker_bash() {
    docker run -it --entrypoint /bin/bash $1
}

function gitignore() {

    echo "Generating a .gitignore file in the current directory."

    curl https://raw.githubusercontent.com/github/gitignore/master/Java.gitignore >> ./.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/master/Global/JetBrains.gitignore >> ./.gitignore

    echo -e "# More JetBrains crap" >> ./.gitignore
    echo -e "*.iml\n*.ipr" >> ./.gitignore

    echo -e "# Sublime Text" >> ./.gitignore
    echo -e "*sublime-*" >> ./.gitignore
}

