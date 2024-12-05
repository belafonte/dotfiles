#!/bin/bash

set -eufo pipefail

echo "check if homebrew is already installed"
# Check if Homebrew is installed, and install it if missing
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


echo "Installig Brew Packages"
# install xcode cmd 
xcode-select --install

# Update any existing homebrew recipes
brew update

# Install my brew packages
# A
brew install asdf

# B
brew install bottom

# C
brew install clojure/tools/clojure
brew install colima

# D
brew install docker

# E
brew install eza

# F
brew install ffmpeg
brew install fish
brew install fzf

# G
brew install gh
brew install git
brew install git-delta
brew install gnupg
brew install gnu-sed

# K
brew install karabiner

# L
brew install lazydocker
brew install lazygit

# M
brew install mackup
brew install mas

# N
brew install neovide
brew install nvim

# P
brew install python

# R
brew install ripgrep
brew install rio
brew install rustup

# S
brew install starship

# T
brew install tmux

# W
brew install wget

# Z
brew install zoxide

# needed for image nvim plugin
# brew install imagemagick
# brew install luarocks
# luarocks --local --lua-version=5.1 install magick

# installing cargo and rust
# rustup-init

bw config server https://vault.bitwarden.eu
