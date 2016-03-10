#!/bin/sh
brew install ack
brew install git
brew install fasd
brew install httpie
brew install lua
brew install luarocks
brew install caskroom/cask/brew-cask

brew cask install mjolnir

./mjolnir.sh

~/dotfiles-mac/links.sh

