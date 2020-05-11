#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

brew install antlr
brew install bison
brew install ccls
brew install cmake
brew install curl
brew install fd
brew install ffmpegthumbnailer
brew install flex
brew install fzf
brew install gcc
brew install gdb
brew install git
brew install go
brew install grep
brew install grip
brew install llvm
brew install neofetch
brew install neovim
brew install node
brew install open-mesh
brew install openssh
brew install perl
brew install python
brew install qt
brew install ranger
brew install ruby
brew install tree
brew install tty-clock
brew install vim --with-override-system-vi
brew install wget --with-iri
brew install xz
brew install yarn
brew install zplug
brew install zsh

# Remove outdated versions from the cellar.
brew cleanup
