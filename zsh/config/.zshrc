# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
if [[ -f $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then 
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
    if [[ -f "${ZDOTDIR}/p10k.zsh" ]]; then
        source "${ZDOTDIR}/p10k.zsh"
    fi
fi 

# load shell config
source "$ZDOTDIR/config.zsh"
# load plugins
source "$ZDOTDIR/plugins.zsh"

# load custom configs
for file in "$ZDOTDIR/zsh.d"/*.zsh; do
    source "$file"
done
