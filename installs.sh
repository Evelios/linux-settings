#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
  echo "You need to run with root sudoer permissions"
  exit 1
fi

is_installed_package() {
  dpkg -l $1 > /dev/null 2>&1
}

is_installed_python() {
  python -c "import $1" 2> /dev/null
}

is_installed_python3() {
  python3 -c "import $1" 2> /dev/null
}

install_package() {
  if is_installed_package $1; then
    echo "Package already installed: $1"
  else
    apt-get install --assume-yes $1
  fi
}

install_python_library() {
  if is_installed_python $1; then
    echo "Python library already installed: $1"
  else
    pip install $1
  fi
}

install_python3_library() {
  if is_installed_python3 $1; then
    echo "Python3 library already installed: $1"
  else
    pip3 install $1
  fi
}

# Use the downloads directory as the staging ground
cd ~/Downloads

# Update Package Manager
apt-get update

libraries=(
  liberror-perl
  ruby`ruby -e 'puts RUBY_VERSION[/\d+\.\d+/]'`-dev
)

applications=(
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
)

python_packages=(
  python-pip
  python-numpy
  python-scipy
  python-matplotlib
  python-pandas
  python-sympy
  python-nose
  python-neovim
  python3-pip
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
  neovim
)

python3_libraries=(
  neovim
)

for library in "${libraries[@]}"; do
  install_package $library
done

for application in "${applications[@]}"; do
  install_package $application
done

for library in "${python_packages[@]}"; do
  install_package $library
done

for library in "${python_libraries[@]}"; do
  install_python_library $library
done

for library in "${python3_libraries[@]}"; do
  install_python3_library $library
done

# Set Up Zsh
# gem install neovim
# npm install -g neovim

# Oh-My-Zsh
# curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
# wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -

# Chrome
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome-stable_current_amd64.deb
