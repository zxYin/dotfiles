source ~/.bash_profile

# ZSH
# ZSH_THEME="robbyrussell"
export ZSH=/Users/yinzixin/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
zmodload zsh/nearcolor
PURE_CMD_MAX_EXEC_TIME=10
zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:git:arrow color '#272822'
zstyle :prompt:pure:git:dirty color '#272822'
zstyle :prompt:pure:execution_time color '#272822'
prompt pure

alias vim='nvim'
alias trash="rmtrash"
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"

# export LDFLAGS="-L/usr/local/opt/bison/lib -L/usr/local/opt/llvm/lib -L/usr/local/opt/flex/lib -L/usr/local/opt/qt/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/flex/include -I/usr/local/opt/openjdk/include -I/usr/local/opt/qt/include"
export LDFLAGS="-L/usr/local/opt/bison/lib -L/usr/local/opt/flex/lib -L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/flex/include -I/usr/local/opt/openjdk/include -I/usr/local/opt/qt/include"

# Qt
export PATH="/usr/local/opt/qt/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"
# Bison
export PATH="/usr/local/opt/bison/bin:$PATH"
# Flex
export PATH="/usr/local/opt/flex/bin:$PATH"
# Gatsby
export PATH="/usr/local/Cellar/node/10.7.0/bin:$PATH"
# Go
export GOPATH="/Users/yinzixin/go:$PATH"
# Openjdk
export PATH="/usr/local/opt/openjdk/bin:$PATH"
# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-13.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"
# RUBUG
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Git
plugins=(
  git
)
alias git='LANG=en_GB git'

# z.sh
source ~/z.sh

# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/yinzixin/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/yinzixin/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yinzixin/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/yinzixin/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
export PATH="/Users/yinzixin/opt/anaconda3/bin:$PATH"
