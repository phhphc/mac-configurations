# Common options 
setopt autocd                                                   # Change directory just by typing its name
setopt interactivecomments                                      # Allow comments in interactive mode
setopt notify                                                   # Report the status of background jobs immediately
setopt nobeep                                                   # No beep
PROMPT_EOL_MARK=""                                              # Hide EOL sign ('%')
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

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
HISTFILE="$ZDOTDIR/.zhistory"
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

# Enable color support of ls, less and man, and also add handy aliases 
if command -v dircolors &> /dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b $ZDOTDIR/.dircolors)" || eval "$(dircolors -b)"

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

