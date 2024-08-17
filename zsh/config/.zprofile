# home brew
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$(brew --prefix)/bin":$PATH

# Using GNU tools
export PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"

# user binary
# export PATH=$HOME/bin:$PATH
export PATH=$PATH:$HOME/bin

# Go bin path
export PATH=$PATH:$(go env GOPATH)/bin

# config pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Added by Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# openjdk
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"

# config work alias 
alias lkf="source /Users/phhphc/Projects/kinfra-devenv/sourcing"

# java version manager
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

