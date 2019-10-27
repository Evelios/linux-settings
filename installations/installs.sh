#!/bin/bash

. install-lib.sh

repositories=(
  ppa:lutris-team/lutris
)

packages=(
  # Core
  cmake
  curl
  git
  zsh
  curl
  ruby
  nodejs
  npm
  python
  python3
  vim
  neovim
  texlive-full
  lilypond

  # Libraries
  liberror-perl
  ruby`ruby -e 'puts RUBY_VERSION[/\d+\.\d+/]'`-dev

  # Games
  lutris

  # Python Packages
  python-pip
  python-numpy
  python-scipy
  python-matplotlib
  python-pandas
  python-sympy
  python-nose
  python-neovim
  python3-pip
  python3-venv
  python3-numpy
  python3-scipy
  python3-matplotlib
  python3-pandas
  python3-sympy
  python3-nose
  python3-neovim
  ipython
)

python_libraries=(
  virtualenv
  neovim
)

python3_libraries=(
  neovim
)

install_setup
add_repositories          "${repositories[@]}"
update_package_manager
install_packages          "${packages[@]}"
install_python_libraries  "${python_libraries[@]}"
install_python3_libraries "${python3_libraries[@]}"

# Set Up Zsh
# gem install neovim
# npm install -g neovim

# Oh-My-Zsh
# curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
# wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -

# Chrome
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome-stable_current_amd64.deb
