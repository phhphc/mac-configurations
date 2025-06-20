#!/bin/bash

brew install openjdk@21
jenv add "$(brew --prefix)"/opt/openjdk@21/
