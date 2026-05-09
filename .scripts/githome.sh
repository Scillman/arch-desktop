#!/usr/bin/env bash

COLOR_RED='\e[1;31m'
COLOR_NC='\e[0'

dir=${PWD}
dir_name=${PWD##*/}

finished=false
while [[ $finished = false ]]; do
  if [[ -z $dir_name ]]; then
    printf "${COLOR_RED}You are not in a git repository${COLOR_NC}\n"
    finished=true
  elif [[ -d "$dir/.git" ]]; then
    cd "$dir"
    finished=true
  else
    dir=$(dirname "$dir")
    dir_name=${dir##*/}
  fi
done

##
## Add the following line to your ~/.bashrc file:
##   alias githome='source ~/.scripts/githome.sh'
##
