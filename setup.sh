#!/usr/bin/env bash

script_directory="$(cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
backup_dir=~/.dot_backup

if [[ ! -e ~/.fonts ]]; then
  mkdir ~/.fonts
fi

echo "Installing DejaVuSansMono Fonts"
cp -r DejaVuSansMono ~/.fonts


# Create backup directories
if [[ -e $backup_dir ]]; then
  rm -r $backup_dir
fi

echo "Putting backup of previous dot files in $backup_dir"
mkdir $backup_dir

for file in $(ls -A $script_directory); do
  if [[ $file == "DejaVuSansMono"             ]]; then continue; fi
  if [[ $file == "Putty-Fish-Of-Paradise.reg" ]]; then continue; fi
  if [[ $file == "setup.sh"                   ]]; then continue; fi
  if [[ $file == "check-installs.sh"          ]]; then continue; fi
  if [[ $file == "README.md"                  ]]; then continue; fi
  if [[ $file == ".git"                       ]]; then continue; fi

  echo "  Linking up $file"

  # Move to create a backup
  if [[ -e ~/$file ]]; then
    mv ~/$file $backup_dir/$file
  fi

  # Link config files to the git config files
  ln -s $script_directory/$file ~/$file

done

# Create the Neovim Setup Files
mkdir -p ~/.config/neovim
ln -s ~/.vimrc ~/.config/neovim
