#!/bin/bash
COUNT=false
while getopts ":c" opt; do
  case $opt in
    c)
      COUNT=true
      ;;
    *)
      ;;
  esac
done

if [[ $COUNT == true ]];then
	nodejs 24.js $@ | sort | uniq | wc -l
else 
	nodejs 24.js $@ | sort | uniq 
fi;