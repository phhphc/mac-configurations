#!/bin/zsh

__hb_shl_handler="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [[ -f "$__hb_shl_handler" ]]; then 
  source "$__hb_shl_handler"
fi 
