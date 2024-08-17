#!/bin/zsh

__hb_asg_handler="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [[ -f "$__hb_asg_handler" ]]; then 
  source "$__hb_asg_handler"
fi 
