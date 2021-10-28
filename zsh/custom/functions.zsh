#!/bin/zsh

# docker ssh. requires docker and jq
function docker_ssh() {
    if [[ "$2" != "" ]]; then
	    PORT_EXT="-p $2"
    fi
    ssh root@$(docker inspect $1 | jq '.[0].NetworkSettings.Networks.bridge.IPAddress' --raw-output) ${PORT_EXT};
}

# bash from within a docker instance. just pass the docker image name. very basic
function docker_bash() {
    docker run -it --entrypoint /bin/bash $1
}

function git_root() {
    cd $(git rev-parse --show-toplevel)
}

# gets container name and image of all running instances
function derps() {
    watch "docker ps --format \"{{.Names}}: {{.Image}}\""
}

function gitignore() {

    echo "Generating a .gitignore file in the current directory."

    curl https://raw.githubusercontent.com/github/gitignore/master/Java.gitignore >> ./.gitignore
    curl https://raw.githubusercontent.com/github/gitignore/master/Global/JetBrains.gitignore >> ./.gitignore

    echo -e "# More JetBrains crap" >> ./.gitignore
    echo -e "*.iml\n*.ipr" >> ./.gitignore

    echo -e "# Sublime Text" >> ./.gitignore
    echo -e "*sublime-*" >> ./.gitignore

    echo -e "# Vim" >> ./.gitignore
    echo -e "*.swp" >> ./.gitignore
}

function pip_install() {
    python -m pip install -U $1 --user
}

# create a new sublime project for this directory (or argument) or open 
# a project if one exists there
function stn() {

    local target=$1

    if [[ "${target}" == "" ]]; then
        target=$(pwd);
    elif [[ ! -d ${target} ]]; then
        echo "${target} is not a valid directory"
        return 1
    fi

    local sublime_project_file=$target/$(basename $target).sublime-project

    if [[ ! -f $sublime_project_file ]]; then
        
        touch $sublime_project_file

        echo -e "{"                         >> $sublime_project_file
        echo -e "\t\"folders\":"            >> $sublime_project_file
        echo -e "\t\t[{"                    >> $sublime_project_file
        echo -e "\t\t\t\"path\": \".\","    >> $sublime_project_file
        echo -e "\t\t\t\"file_exclude_patterns\": []" >> $sublime_project_file
        echo -e "\t\t}]"                    >> $sublime_project_file
        echo -e "}"                         >> $sublime_project_file

        echo -e "New Sublime Text project created:\n\t${sublime_project_file}"

    fi
}

# adapted from: https://dhoeric.github.io/2017/https-to-ssh-in-gitmodules
function git_origin_to_https() {
    OLD_URL=$(git remote get-url origin)
    if [[ $(echo $OLD_URL | grep -c ^https) == 1 ]]; then
        echo "origin is already pointing to https: '$OLD_URL'";
        return;
    fi
    NEW_URL=$(echo $OLD_URL | perl -p -e 's|git@(.*?):|https://\1/|g')
    git remote set-url origin $NEW_URL
}

# adapted from: https://dhoeric.github.io/2017/https-to-ssh-in-gitmodules
function git_origin_to_ssh() {
    OLD_URL=$(git remote get-url origin)
    if [[ $(echo $OLD_URL | grep -c ^https) == 0 ]]; then
        echo "origin does not appear to already be using https: '$OLD_URL'";
        return;
    fi
    NEW_URL=$(echo $OLD_URL | perl -p -e 's|https://(.*?)/|git@\1:|g')
    git remote set-url origin $NEW_URL
}
