#!/bin/zsh

BREW_PREFIX="$(brew --prefix)"


# load zsh-autosuggestions
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"


# load zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk # bind jk for escape in insert mode
ZVM_INIT_MODE=sourcing # init plugin when sourcing, turn off lazy init
source "$BREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT # default to normal mode for each command line


# load zsh-syntax-highlighting
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load history fuzzy search
source <(fzf --zsh)
