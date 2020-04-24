source ~/.bash_profile
source ~/.dotfiles/include_path.sh

export MANPATH=/usr/share/man

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:path color cyan
prompt pure

alias vim='nvim'
alias trash="rmtrash"
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"

# fzf
export FZF_BASE=/usr/local/opt/fzf
export FZF_DEFAULT_OPTS='--height 70% --color "gutter:#272822,bg+:#272822,info:#444444" --preview "
\ (bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -200"'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# Use fd instead of the default find
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    # *)            fzf "$@" --preview 'bat --style=numbers --color=always {} | head -500' ;;
    *)            fzf "$@" --preview '(bat --style=numbers --color=always {} ||
        \tree -C {}) 2> /dev/null | head -200' ;;
  esac
}

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"
  zgen oh-my-zsh
  # plugins
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load rupa/z
  # bulk load
  zgen loadall <<EOPLUGINS
  zsh-users/zsh-history-substring-search
EOPLUGINS
  # generate the init script from plugins above
  zgen save
fi

source ~/.dotfiles/custom.sh

bindkey -v
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey "$terminfo[kcuu1]" history-beginning-search-backward
bindkey "$terminfo[kcud1]" history-beginning-search-backward
KEYTIMEOUT=1

zstyle ':bracketed-paste-magic' active-widgets '.self-*'

source ~/zshfiles/zsh-interactive-cd.plugin.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
