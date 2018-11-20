#!/bin/bash

if [[ $# == 0 ]]; then
  echo "Usage : follow [file] [command]"
elif [[ $# == 1 ]]; then
  echo "Provide A Command To Run"
elif [[ $# != 2 ]]; then
  echo "Too Many Arguments Provided"
fi

watch_file=$1
run_command=$2

# Set initial time of file
initial_time=`stat -c %Z $watch_file`

while true; do
  modified_time=`stat -c %Z $watch_file`

  # Check to see if the file has been updated
  if [[ "$modified_time" != "$initial_time" ]]; then
    eval "$run_command"
    initial_time=$modified_time
  fi

  sleep 1
done
