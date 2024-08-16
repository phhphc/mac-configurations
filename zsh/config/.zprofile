# home brew
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$(brew --prefix)/bin":$PATH

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
export PATH="$PATH:/Users/phhphc/Library/Application Support/JetBrains/Toolbox/scripts"

# openjdk
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"

# config work alias 
alias lkf="source /Users/phhphc/Projects/kinfra-devenv/sourcing"

##
# Your previous /Users/phhphc/.zprofile file was backed up as /Users/phhphc/.zprofile.macports-saved_2024-02-15_at_16:05:43
##

# MacPorts Installer addition on 2024-02-15_at_16:05:43: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2024-02-15_at_16:05:43: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

# java version manager
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

