#!/bin/bash

# compile spell files
nvim --headless -u NONE --cmd ":mkspell! config/spell/vi.utf-8.spl config/dictionaries/vi.dic" -c 'q'

ln -s "$PWD"/config ~/.config/nvim
ln "$PWD"/config-v2 ~/.config/nvim2
ln -s "$PWD"/astronvim_v5 ~/.config/astronvim_v5

NVIM_APPNAME=nvim2 nvim --headless +"redir => result | silent checkhealth lazy | redir END | put =result | w! /dev/stdout | qall"
