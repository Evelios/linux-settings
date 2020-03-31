# ---- Terminal Setup ----------------------------------------------------------

# Try to set up zsh as the subshell
use_zsh=true
zsh_path=$(which zsh 2> /dev/null)

if [[ $use_zsh == true && -e $zsh_path ]]; then

  # Setup to use the zsh terminal
  if [[ $SHELL != $zsh_path ]]; then
    export SHELL=$zsh_path

    # If the server actually holds your user information
    if [[ $(grep $(whoami) /etc/passwd) != "" ]]; then
      # Change the default shell to ZSH
      chsh -s $zsh_path
    else
      # Run ZSH as a shell within the default shell (Not Preferable)
      $zsh_path
    fi
  fi

else

  # Use the bash terminal
  export SHELL=$(which bash 2> /dev/null)

fi
unset zsh_path

# ---- General Setup -----------------------------------------------------------

# Set the default file permissions for files to rwxrwxr-x
umask 002

# Ignore duplicate lines or lines starting with a space in the history

# HISTCONTROL=ignoreboth

# History file size settings

# HISTSIZE=1000
# HISTFILESIZE=2000

# ---- Source Config Files -----------------------------------------------------

if [[ -e ~/.aliasrc ]]; then
  . ~/.aliasrc
fi

if [[ -e ~/.gfaliasrc ]]; then
  . ~/.gfaliasrc
fi

# ---- Environment Variables ---------------------------------------------------

addToPath() {
  if [[ -e "$1" ]]; then
    export PATH=$PATH:"$1"
  fi
}

addToPath $HOME/.local/bin                      # Local Bin Path
addToPath /bin                                  # Root binary baths
addToPath /sbin
addToPath /opt/rh/llvm-toolset-7/root/usr/bin/  # LLVM Framework
addToPath /usr/lib64                            # For the ddd debugger
addToPath /usr/share/doc
addToPath ~/.cabal/bin                          # Haskell Cabal binaries
addToPath ~/.gitcommands                        # Local git commands
addToPath ~/scripts                             # Local script files

# Mitosis Keyboard
export GNU_INSTALL_ROOT=/usr/

# Python Settings
if [[ -e $(which python3 2> /dev/null) ]]; then
  export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
  export PATH=$PATH:$PYTHON_BIN_PATH
fi

# ---- Set up color prompt -----------------------------------------------------

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Import the dircolors and enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    eval $(dircolors -b $HOME/.dircolors)
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Log into the default development environment
if [[ "$HOSTNAME" == "vfc9jump01" || "$HOSTNAME" == "vfc9jump02" || "$HOSTNAME" == "pfetxv12p01" ]]; then
  prod
fi
