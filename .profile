# ---- Terminal Setup ----------------------------------------------------------

# Change xterm setting to 256 color mode
if [[ "$TERM" == "xterm" ]]; then
  export TERM=xterm-256color
fi

# Try to set up zsh as the subshell
use_zsh=false
zsh_path=$(which zsh 2> /dev/null)

if [[ $use_zsh == true && -e $zsh_path && $SHELL != $zsh_path ]]; then

  # Use the zsh terminal
  export SHELL=$zsh_path

  if [[ $(grep $(whoami) /etc/passwd) != "" ]]; then
   chsh -s $zsh_path 
  else
    $zsh_path
  fi

else

  # Use the bash terminal
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

# ---- Commands not available in zsh ----
# Append to the history file not overwrite it
#shopt -s histappend
# Check the window size after each command and if necessary update window size
#shopt -s checkwinsize

# ---- Source Config Files -----------------------------------------------------

if [[ -e ~/.aliases ]]; then
  . ~/.aliases
fi

if [[ -e ~/.gf_aliases ]]; then
  . ~/.gf_aliases
fi

# ---- Environment Variables ---------------------------------------------------

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Mitosis Keyboard
export GNU_INSTALL_ROOT=/usr/

if [[ -e ~/.gitcommands ]]; then
  export PATH=$PATH:~/.gitcommands
fi

# Python Settings
if [[ -e $(which python3 2> /dev/null) ]]; then
  PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
  PATH="$PATH:$PYTHON_BIN_PATH"
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
