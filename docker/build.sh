#!/bin/bash 
[[ -n $DOCKER ]] || DOCKER=docker
command -v $DOCKER &> /dev/null || echo "ERROR: cannot find docker try DOCKER=<PATH TO DOCKER> $0"
echo -e "\e[H\e[J" 
echo -e "\e[37;1m    ___                                                __\e[0m"
echo -e "\e[37;1m   /   |  _________ _____  ____  ____  ____  ___  ____/ /\e[0m"
echo -e "\e[37;1m  / /| | / ___/ __ \`/ __ \/ __ \/ __ \/ __ \/ _ \/ __  / \e[0m"
echo -e "\e[37;1m / ___ |/ /  / /_/ / /_/ / / / / /_/ / / / /  __/ /_/ /  \e[0m"
echo -e "\e[37;1m/_/  |_/_/   \__, /\____/_/ /_/\____/_/ /_/\___/\__,_/   \e[0m"
echo -e "\e[37;1m            /____/                                       \e[0m"
echo -e "\e[37;1m                                                   BUILD \e[0m"
echo "_________________________________________________________"
[[ x$1 != x ]] && TARGET_DISTRO=$1 || { echo -e "\e[37;1mERROR:\e[0m Target OS not set! USAGE $0 <TARGET OS> [GIT BRANCH]"; exit 1; }
[[ x$2 != x ]] && GIT_BRANCH=$2
echo "BUILD PACKAGE FOR [ $TARGET_DISTRO ]"
$DOCKER build -t argone-compile . 2>/dev/null
$DOCKER run --name extract -e TARGET_DISTRO=$TARGET_DISTRO -e GIT_BRANCH=$GIT_BRANCH argone-compile 2>/dev/null
$DOCKER cp extract:/output/ ./ 2>/dev/null
$DOCKER rm extract &>/dev/null