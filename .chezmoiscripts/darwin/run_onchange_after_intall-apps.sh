echo "Installing Apps"

# Install App Store packages

# Install Keynote
mas install 409183694
# Install Numbers
mas install 409203825
# Install Pages
mas install 409201541
# Install Cyberduck
mas install 409222199
# Install Pixelmator Pro
mas install 1289583905
# Install Screens 4
mas install 1224268771
# Install  Amphetamine
mas install 937984704
# Install  WhatsApp Desktop
mas install 1147396723
# Install  Telegram
mas install 747648890
# Install  XCode
mas install 497799835
sudo xcodebuild -license accept
sudo xcode-select --switch /Applications/Xcode.app

# Install  ifolor Designer 
mas install 446366603
# Install Timelime Time Tracking
mas install 589698946
# Install WireGuard
# mas install 1451685025

# Install Final Cut Pro
mas install 424389933
# install Compressor
mas install 424390742
# install Affinity Designer
mas install 824171161
# install Affiniy Publisher
mas install 881418622
# # install Bitwarden
# mas install 1352778147
# install Blackmagic Speed Test
mas install 425264550

# Safari Extensions
# install Vimari
mas install 1480933944
#install Vinegar Tube Cleaner
mas install 1591303229


# Install cask packages

# A
brew install --cask appcleaner

# B
brew install --cask betterzip
brew install --cask bitwarden
brew install --cask blender

# C
brew install --cask google-chrome

# D
# brew install --cask drawio

# E
brew install --cask element

# F
brew install --cask firefox

# K
brew install --cask kap
brew install --cask karabiner-elements
brew install --cask kitty

# M
brew install --cask macvim
brew install --cask microsoft-teams
brew install --cask middleclick --no-quarantine
brew install --cask miro
brew install --cask monitorcontrol
brew install --cask mouse-fix

# N
brew install --cask neovide

# O
brew install --cask obsidian

# P
brew install --cask postman

# Q
brew install --cask qlmarkdown
brew install --cask quicklook-json

# R
brew install --cask rio

# S
brew install --cask signal
brew install --cask spotify
brew install --cask syntax-highlight

# T
brew install --cask tableplus
brew install --cask touchdesigner

# V
brew install --cask vivid
brew install --cask visual-studio-code
brew install --cask vlc

# Z
brew install --cask zoom

# add middle click to login items
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/MiddleClick.app", hidden:true}'
