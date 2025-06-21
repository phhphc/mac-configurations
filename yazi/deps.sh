#!/bin/bash

# brew install poppler

. ../required.sh

DRAG_PATH="$BINARY_DIR/drag"
SOURCE_DIR=".local/dragterm"
CURR_DIR=$(pwd)
if [ ! -f "$DRAG_PATH" ]; then
    if [ ! -d "$SOURCE_DIR" ]; then
        git clone git@github.com:phhphc/dragterm.git "$SOURCE_DIR"
    fi
    cd "$SOURCE_DIR/dragterm"
    brew install cocoapods
    g++ DTDraggingSourceView.m main.m  -framework Cocoa -o "$DRAG_PATH"
    brew remove cocoapods
    cd "$CURR_DIR"
fi
