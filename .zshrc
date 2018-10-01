# Source all the information that is stored in the .profile
# This isn't necessary if the starting shell is bash since it
# gets sourced from within the .profile. This is needed however if
# zsh is the default shell because it doesn't source the .profile
# I need to set a way to make sure this is only sourced once
[[ -e ~/.profile ]] && emulate sh -c "source ~/.profile"

# Expand ~ into the full directory
set -o magicequalsubst

# ---- Oh My ZSH! --------------------------------------------------------------

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

if [[ -e $ZSH ]]; then

plugins=(
  git
  zsh-syntax-highlighting
)

ZSH_THEME="agonster_custom"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

if [[ -e ~/.zsh_keybind ]]; then
  . ~/.zsh_keybind
fi

# Remapping the escape sequence
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fi # End oh-my-zsh
