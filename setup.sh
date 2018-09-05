#!/usr/bin/env bash

script_directory="$(cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
backup_dir=~/.dot_backup

non_config_files=(
  .git
  setup.sh
)

echo $script_directory

non_config_files=(
  .git
  setup.sh
)

# Create backup directories
if [[ -e $backup_dir ]]; then
  rm -r $backup_dir 
fi

echo "Putting backup of previous dot files in $backup_dir" 
mkdir $backup_dir

for file in $(ls -A $script_directory); do
  if [[ $file == ".git"     ]]; then continue; fi
  if [[ $file == "setup.sh" ]]; then continue; fi

  echo "  Linking up $file"
 
  # Move to create a backup
  if [[ -e ~/$file ]]; then 
    mv ~/$file $backup_dir/$file
  fi

  # Link config files to the git config files
  ln -s $script_directory/$file ~/$file

done
