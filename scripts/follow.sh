#!/bin/bash

function usage {
  echo ''
  echo 'This program watches a collection of files and runs a command whenever'
  echo 'any of those files have changed.'
  echo ''
  echo 'Usage:'
  echo '  follow [df] <command> <file(s)...>'
  echo '    -f  : Pass the file that was changed to the command'
  echo '    -h  : Print the help text'
  echo ''
  exit 1
}

function printHeader {
  file=$1
  echo "----------------------------------------"
  echo "---- File Changed : $file"
  echo "----------------------------------------"
}

function getTimestamp {
  stat -c %Z $1
}

# ---- Process the arguments ---------------------------------------------------

if [[ $# == 0 ]]; then
  usage
elif [[ $# == 1 ]]; then
  echo "Provide Files To Run"
fi

while getopts ":fh" opt; do
  case $opt in
    f)
      PASS_FILE=true
      ;;
    h)
      usage
      ;;
    \?)
      echo "Please check the proper usage"
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
  esac
done

# Command Parsing My Not Be Happening
run_command=$1
shift
followed_files=$@

# ---- Set timestamps for all files --------------------------------------------

declare -A file_timestamps
for file in $followed_files; do
  file_timestamps[$file]=$(getTimestamp $file)
done

# ---- Wait for modifications and run command ----------------------------------

while true; do

  for file in "${!file_timestamps[@]}"; do
    initial_time="${file_timestamps[$file]}"
    modified_time=$(getTimestamp $file)

    # Check to see if the file has been updated
    if [[ "$modified_time" != "$initial_time" ]]; then
      printHeader $file
      file_timestamps[$file]="$modified_time"

      # Run the user command
      if [[ $PASS_FILE == true ]]; then
        # echo "$run_command $file"
        eval "$run_command $file"
      else
        eval "$run_command"
      fi
    fi
  done

  sleep 1

done
