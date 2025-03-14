#!/bin/bash

set -eufo pipefail

if [ -w /opt/homebrew ]; then
  echo "Installig Brew Packages"

  # Update any existing homebrew recipes
  brew update

  # Install my brew packages
  # A
  brew install asdf
  brew install age

  # B
  brew install bottom
  brew install bat
  brew install btop
  brew install bitwarden-cli

  # C
  brew install curl
  brew install clojure/tools/clojure
  brew install colima

  # D
  brew install docker
  brew install dockutil

  # E
  brew install eza
  brew install exiftool

  # F
  brew install ffmpeg
  brew install fish
  brew install fzf
  brew install fd

  # G
  brew install gdu
  brew install gh
  brew install git
  brew install git-delta
  brew install gnupg
  brew install gnu-sed

  #I
  brew install imagemagick

  # J
  brew install jq

  # K
  
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
  # brew install python
  brew install postgresql@15
  brew install pspg

  # R
  brew install ripgrep
  brew install rustup

  # S
  brew install starship
  brew install sqlc
  brew install shared-mime-info

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
fi

json_str=$(bw status)

# Check if 'status' is 'unauthenticated'
if [[ $(echo "$json_str" | jq -r '.status') == "unauthenticated" ]]; then
    echo "Bitwarden is unauthenticated."
    bw config server https://vault.bitwarden.eu
    bw login
else
    echo "Bitwarden alread set up"
fi
