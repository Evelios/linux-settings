install_setup() {
  if [[ "$EUID" -ne 0 ]]; then
    echo "You need to run with root sudoer permissions"
    exit 1
  fi

  # Use the downloads directory as the staging ground
  cd ~/Downloads
}

update_package_manager() {
  apt-get update
}

add_repositories() {
  for repo in "$@"; do
    add_repository $repo
  done
}

add_repository() {
  add-apt-repository --yes $1
}

install_packages() {
  for package in "$@"; do
    install_package $package
  done
}

install_package() {
  if is_installed_package $1; then
    echo "Package already installed: $1"
  else
    apt-get install --assume-yes $1
  fi
}

is_installed_package() {
  dpkg -l $1 > /dev/null 2>&1
}

install_python_libraries() {
  for library in "$@";do
    install_python_library $library
  done
}

install_python_library() {
  if is_installed_python $1; then
    echo "Python library already installed: $1"
  else
    pip install $1
  fi
}

is_installed_python() {
  python -c "import $1" 2> /dev/null
}

install_python3_libraries() {
  for library in "$@";do
    install_python3_library $library
  done
}

install_python3_library() {
  if is_installed_python3 $1; then
    echo "Python3 library already installed: $1"
  else
    pip3 install $1
  fi
}

is_installed_python3() {
  python3 -c "import $1" 2> /dev/null
}
