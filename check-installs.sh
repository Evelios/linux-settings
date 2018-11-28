#!/usr/bin/env bash

programs=(
  # Basics
  make
  gcc
  g++
  # Editors
  vim
  neovim
  # Programming Languages
  python3
  python2
  perl
  ruby
  gem    # ruby package manager
  nodejs
  npm
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
