# ---- Terminal Setup ----------------------------------------------------------
zsh_path=$(which zsh)

# Try to set up zsh as the subshell
if [[ -f $zsh_path && $SHELL != $zsh_path ]]; then

  if [[ $(grep $(whoami) /etc/passwd) ]]; then
   chsh -s $zsh_path 
  else
    $zsh_path
  fi

fi

# ---- Environment Variables ---------------------------------------------------

# Mitosis Keyboard
export GNU_INSTALL_ROOT=/usr/

# Python Settings
if [[ -e $(which python3) ]]; then
  PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
  PATH="$PATH:$PYTHON_BIN_PATH"
fi

# ---- General Setup -----------------------------------------------------------
umask 002

# ---- Directory Structure -----------------------------------------------------

# ---- Common Commands ---------------------------------------------------------

alias settings="vim ~/.profile"
alias refresh="source ~/.profile"

alias vi="vim"
alias v="vim"

alias l="ls"
alias ll="ls -ltr"
alias la="ls -A"


# ---- Set up color prompt -----------------------------------------------------

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


