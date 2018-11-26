#!/usr/bin/env bash

programs=(
  make
  gcc
  g++
  vim
  python
  perl
)

echo "Double Check The Following:"
echo "+ Graphics Card Drivers"
echo "+ Wireless Card Drivers"
echo ""
echo "List Of Uninstalled Programs:"

for program in $programs; do
  if [[ ! $(command -v $program) ]]; then
    echo "+ $program"
  fi
done

echo ""
