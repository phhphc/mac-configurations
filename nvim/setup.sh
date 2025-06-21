#!/bin/bash

# compile spell files
nvim --headless -u NONE --cmd ":mkspell! config/spell/vi.utf-8.spl config/dictionaries/vi.dic" -c 'q'

ln -s "$PWD"/config ~/.config/nvim
