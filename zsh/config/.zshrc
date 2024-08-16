# Load Powerlevel10k
if [[ -f $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then 
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi 


# Common options 
setopt autocd                                                   # Change directory just by typing its name
setopt interactivecomments                                      # Allow comments in interactive mode
setopt notify                                                   # Report the status of background jobs immediately
setopt nobeep                                                   # No beep

PROMPT_EOL_MARK=""                                              # Hide EOL sign ('%')
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
if command -v nvim &> /dev/null; then                           # Use neovim as default editor
  export EDITOR=nvim
  export VISUAL=nvim
fi


# Enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_expire_dups_first # Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # Ignore duplicated commands history list
setopt hist_ignore_space      # Ignore commands that start with space
setopt hist_verify            # Show command with history expansion to user before running it
setopt append_history         # Immediately append history instead of overwriting
setopt inc_append_history     # Save commands are added to the history immediately, otherwise only when shell exits.
#setopt share_history         # Share command history data

alias history="history 0"     # force zsh to show the complete history


# Using GNU tools
export PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"

# Enable color support of ls, less and man, and also add handy aliases 
if command -v dircolors &> /dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls="ls --color=auto"
    alias dir="dir --color=auto"
    alias grep="grep --color=auto"
    alias diff="diff --color=auto"
   
    export LESS_TERMCAP_mb=$'\E[1;31m'     # Begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # Begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # Reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # Begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # Reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # Begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # Reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi


# Zsh vi-mode
__hb_zvm_handler="$(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
if [[ -f "$__hb_zvm_handler" ]]; then 
  # bind jk for escape in insert mode
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  # init plugin when sourcing, turn off lazy init
  ZVM_INIT_MODE=sourcing
  source "$__hb_zvm_handler"
  # default to normal mode for each command line
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
fi

# Zsh syntax-highlighting
__hb_shl_handler="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [[ -f "$__hb_shl_handler" ]]; then 
  source "$__hb_shl_handler"
fi 


# Zsh auto-suggestions
__hb_asg_handler="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [[ -f "$__hb_asg_handler" ]]; then 
  source "$__hb_asg_handler"
fi 

# Zsh history fuzzy search
if command -v fzf &> /dev/null; then 
  source <(fzf --zsh)
fi

# Terminal file explorer
if command -v yazi &> /dev/null; then 
  function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"
  }
fi


# Common alias
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias p='python'
alias n='node'
alias v='nvim'


# User customize
alias it="open -a Kitty ."
alias ui="open -a Finder ."

########## Preparee #######
# brew tap homebrew/command-not-found
#
######### GNU tool #######
# brew install coreutils
# brew install grep
# brew install gnu-sed
# brew install findutils
#
#
# ######## yazi dep
# brew install poppler

export GPG_TTY=$(tty)


# bun completions
[ -s "/Users/phhphc/.bun/_bun" ] && source "/Users/phhphc/.bun/_bun"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/phhphc/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/phhphc/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/phhphc/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/phhphc/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
