# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pianoman/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$PATH"
export VISUAL=nvim
export EDITOR=nvim

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne "\033[1 q"
  else
    echo -ne "\033[5 q"
  fi
}
zle -N zle-keymap-select

vrun() {
  local tmp
  tmp=$(mktemp)

  {
    "$@"
  } 2>&1 | sed 's/^vrun:[0-9]*: //' | vim -

  rm "$tmp"
}

clera() {
    clear
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

function rcd {
    local tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        cd "$(cat "$tmp")"
        rm -f "$tmp"
    fi

    nvim .
}

tte() {
    upower -i $(upower -e | grep -i battery) | grep -i "time to empty"
}

cd ~/developing/
clear
