#!/bin/zsh

__hb_zvm_handler="$(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
if [[ -f "$__hb_zvm_handler" ]]; then 
  # bind jk for escape in insert mode
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  # init plugin when sourcing, turn off lazy init
  ZVM_INIT_MODE=sourcing
  source "$__hb_zvm_handler"
  # default to normal mode for each command line
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
fi
