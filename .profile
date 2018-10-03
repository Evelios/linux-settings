# ---- Terminal Setup ----------------------------------------------------------

# Change xterm setting to 256 color mode
if [[ "$TERM" == "xterm" ]]; then
  export TERM=xterm-256color
fi

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
  . ~/.bashrc

fi
unset zsh_path

# ---- General Setup -----------------------------------------------------------

# Set the default file permissions for files to rwxrwxr-x
umask 002

# Ignore duplicate lines or lines starting with a space in the history
HISTCONTROL=ignoreboth

# History file size settings
HISTSIZE=1000
HISTFILESIZE=2000

# ---- Source Config Files -----------------------------------------------------

if [[ -e ~/.aliases ]]; then
  . ~/.aliases
fi

if [[ -e ~/.gf_aliases ]]; then
  . ~/.gf_aliases
fi

# ---- Environment Variables ---------------------------------------------------

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# For the ddd debugger
export PATH=$PATH:/usr/lib64:/usr/share/doc

# Mitosis Keyboard
export GNU_INSTALL_ROOT=/usr/

if [[ -e ~/.gitcommands ]]; then
  export PATH=$PATH:~/.gitcommands
fi

# Python Settings
if [[ -e $(which python3 2> /dev/null) ]]; then
  PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
  PATH=$PATH:$PYTHON_BIN_PATH
fi

# ---- Set up color prompt -----------------------------------------------------

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Import the dircolors for the ls command
if [[ -f $HOME/.dircolors ]]; then
  eval $(dircolors -b $HOME/.dircolors)
fi

# Log into the devault development environment
if [[ "$HOSTNAME" == "vfc9jump01" || "$HOSTNAME" == "sfc9pfetxp02" ]]; then
  prod
fi
