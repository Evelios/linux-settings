#!/usr/bin/bash

script_directory="$(cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
backup_dir=~/.dot_backup

dotfiles=(
  .aliasrc
  .bashrc
  .dircolors
  .gfaliasrc
  .gitcommands
  .gitconfig
  .gitignore
  .kshrc
  .oh-my-zsh
  .profile
  scripts
  .vim
  .vimrc
  .zprofile
  .zsh_keybind
  .zshrc
)

directories=(
  .config
  .fonts
)

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

for file in $dotfiles; do
  echo "  Linking up $file"

  # Move to create a backup
  if [[ -e ~/$file ]]; then
    mv ~/$file $backup_dir/$file
  fi

  # Link config files to the git config files
  ln -s $script_directory/$file ~/$file
done

# Create the Neovim Setup Files
cp -prf $script_directory/.config ~/.
