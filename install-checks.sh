#!/usr/bin/bash

checkProgram() {
  program=$1
  version=$2

  program_path=$(which $program)

  if [[ ! -e $program_path ]]; then
    echo "Program is not installed $program_path"
    return
  fi


  if [[ ! -z $version ]]; then
    echo "Version was not specified"
    return
  fi
}
