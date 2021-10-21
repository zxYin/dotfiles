export PATH=/usr/local/bin:$PATH

# export LDFLAGS="-L/usr/local/opt/bison/lib -L/usr/local/opt/llvm/lib -L/usr/local/opt/flex/lib -L/usr/local/opt/qt/lib" export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/flex/include -I/usr/local/opt/openjdk/include -I/usr/local/opt/qt/include"

# LLVM
# export LDFLAGS="-L/usr/local/opt/llvm/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include"
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# Qt
# export PATH="/usr/local/opt/qt/bin:$PATH"
# export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"
# Bison
# export PATH="/usr/local/opt/bison/bin:$PATH"
# Flex
# export PATH="/usr/local/opt/flex/bin:$PATH"
# Gatsby
# export PATH="/usr/local/Cellar/node/10.7.0/bin:$PATH"
# Go
export GOPATH="${HOME}/.go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# # Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# # Openjdk
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Flutter
export PATH="$PATH:${HOME}/flutter/bin"
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# RUBUG
# export PATH="/usr/local/opt/ruby/bin:$PATH"

# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/yinzixin/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/Users/yinzixin/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/yinzixin/opt/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/Users/yinzixin/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<
export PATH="/Users/yinzixin/opt/anaconda3/bin:$PATH"
