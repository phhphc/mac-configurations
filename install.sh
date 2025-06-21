#!/bin/bash

CONFIG_PREFIX=~/.user-config

if [ ! -L "$CONFIG_PREFIX" ] || [ ! -e "$CONFIG_PREFIX" ]; then
    echo "Symlink does not exist or is broken, creating new one"
    ln -s "$(pwd)" "$CONFIG_PREFIX"
fi