# Use neovim as default editor
export EDITOR=nvim
export VISUAL=nvim

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
export PATH=$PATH:$HOME/bin # TODO: remove this line
export PATH=$PATH:"$HOME/.user-config/.bin"

# Go bin path
if command -v go &> /dev/null; then 
  export PATH=$PATH:$(go env GOPATH)/bin
fi

# config pyenv
if command -v pyenv &> /dev/null; then 
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi


# Added by Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# openjdk
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"

# java version manager
if command -v jenv &> /dev/null; then 
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# cargo
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/phhphc/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/phhphc/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/phhphc/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/phhphc/google-cloud-sdk/completion.zsh.inc'; fi

# gpg sign
export GPG_TTY=$(tty)
