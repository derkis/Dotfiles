#!/bin/zsh

# rc paths
export ZSH_RC=$HOME/.zshrc
export ZSH_RCD=$HOME/.zshrc.d

# cosmetics
rs="\033[0m"
gr="\033[0;90m"
gn="\033[1;32m"
yl="\033[1;33m"

# rc utils
printd() {
  if [[ -n $ZSH_VERBOSE ]]; then echo $1; fi
}

load_modules() {
  directory=$1
  if [[ -d $directory ]] && [[ -n "$(ls $directory)" ]]; then
    for dotfile in $directory/*; do
      if [[ ! -d "${dotfile}" ]] && [[ -r "${dotfile}" ]]; then
        printd "${gr}• load: ${dotfile}${rs}"
        source ${dotfile}
      fi
    done
  fi
}

# plugins
load_plugins() {
  printd "➜ step: load plugins"
 
  # plugins -- start
  source $(brew --prefix antigen)/share/antigen/antigen.zsh

  # load oh-my-zsh's library.
  antigen use oh-my-zsh

  # add bundles
  antigen bundle vi-mode
  antigen bundle osx
  antigen bundle command-not-found
  antigen bundle git
  antigen bundle gitfast
  antigen bundle wfxr/forgit

  antigen bundle zsh-users/zsh-completions
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-syntax-highlighting

  # apply plugins
  antigen apply
}

# main
main() {
  # load modules by layer
  load_modules $ZSH_RCD/pre
  load_plugins
  load_modules $ZSH_RCD
  load_modules $ZSH_RCD/post

  # echo final path
  printd "✔ path: $PATH"
  printd "${yl}⭑ ${gn}done!${rs}"

  # cleanup variables
  unset ZSH_VERBOSE
}

# bootstrap
main

