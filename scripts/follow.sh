#!/bin/bash

usage() {
  echo "
  This program watches a collection of files and runs a command whenever
  any of those files have changed.

  Usage:
    follow [df] <command> <file(s)...>
      -f  : Pass the file that was changed to the command
      -c  : Colorize the output
      -h  : Print the help text
  "
  exit 1
}

printHeader() {
  file=$1
  timestamp=$(date +"%T")
  msg="  File Changed  : $timestamp  :  $file"

  echo ''
  if [[ $COLORIZE == 'true' ]]; then
    echo -e "$(colorize "$msg")"
  else
    echo $msg
  fi
  printBar
}

printFooter() {
  if [[ "$1" != "0" ]]; then
    printBar
    msg="\n  Exited with return code : $1"
    if [[ $COLORIZE == 'true' ]]; then
      echo -e "$(colorize "$msg")"
    else
      echo $msg
    fi
  fi
  printBar
}

repl() {
  printf "$1%.s" $(seq 1 $2)
}

printBar() {
  width=$(tput cols)
  bar=$(repl '_' $width)
  if [[ $COLORIZE == 'true' ]]; then
    echo -e "$(colorize "$bar")"
  else
    echo $bar
  fi
}

colorize() {
  DIM='\e[90m'
  NC='\e[0m'
  echo "${DIM}$1${NC}"
}

getTimestamp() {
  stat -c %Z $1
}

# ---- Process the arguments ---------------------------------------------------

if   [[ $# == 0 ]]; then
  usage
elif [[ $# == 1 ]]; then
  echo "Provide Files To Run"
fi

while getopts ":fch" opt; do
  case $opt in
    f)
      PASS_FILE=true
      ;;
    c)
      COLORIZE=true
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

# Remove all the options from the args
shift $((OPTIND -1))

# Command Parsing My Not Be Happening
run_command=$1
shift
followed_files=$@

# ---- Set timestamps for all files --------------------------------------------

declare -A file_timestamps
for file in $followed_files; do
  file_timestamps[$file]=$(getTimestamp $file)
done

# ---- Run command at the start of execution -----------------------------------

if [[ $PASS_FILE != true ]]; then
  eval "$run_command"
fi

printFooter $?

# ---- Wait for modifications and run command ----------------------------------

while true; do

  for file in "${!file_timestamps[@]}"; do
    initial_time="${file_timestamps[$file]}"
    modified_time=$(getTimestamp $file)

    # Check to see if the file has been updated
    if [[ "$modified_time" != "$initial_time" ]]; then
      printHeader $file
      file_timestamps[$file]="$modified_time"

      # Pause for a moment to avoid file permission overlaps
      sleep 0.010 # 10ms

      # Run the user command
      if [[ $PASS_FILE == true ]]; then
        eval "$run_command $file"
      else
        eval "$run_command"
      fi

      printFooter $?
    fi
  done

  sleep 1

done
