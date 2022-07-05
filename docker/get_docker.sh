#!/bin/bash


echo -e "\e[1mSYSTEM CHECK  retrival methods\e[0m"
# echo -n "GIT  : "
# command -v git &> /dev/null && GIT=1 || GIT=0
# [[ $GIT == 1 ]] && echo -e "\e[32mOK\e[0m" || echo -e "\e[31mNO FOUND\e[0m"
# echo -n "WGET : "
# command -v wget &> /dev/null && WGET=1 || WGET=0
# [[ $WGET == 1 ]] && echo -e "\e[32mOK\e[0m" || echo -e "\e[31mNO FOUND\e[0m"
echo -n "CURL : "
command -v curl &> /dev/null && CURL=1 || CURL=0
[[ $CURL == 1 ]] && echo -e "\e[32mOK\e[0m" || echo -e "\e[31mNO FOUND\e[0m"
echo -n "tar  : "
command -v tar &> /dev/null && TAR=1 || TAR=0
[[ $TAR == 1 ]] && echo -e "\e[32mOK\e[0m" || echo -e "\e[31mNO FOUND\e[0m"

[[ $CURL == 0 || $TAR == 0 ]] && { echo "unable to download needed files"; exit 1; }

[[ -d /tmp/argon-docker-install ]] || mkdir /tmp/argon-docker-install
cd /tmp/argon-docker-install

echo -n "DOWNLOADING FILES : "
curl -s https://gitlab.com/DarkElvenAngel/argononed/-/archive/master/argononed-master.tar?path=docker | busybox tar x  && echo -e "\e[32mOK\e[0m" || echo -e "\e[31mERR\e[0m"
echo -n "Tidy Up : "
mv argononed-master-docker/docker/* ./ && rmdir -p argononed-master-docker/docker && echo -e "\e[32mOK\e[0m" || echo -e "\e[31mERR\e[0m"
echo "Done!"
echo "Please change to /tmp/argon-docker-install and run build.sh"