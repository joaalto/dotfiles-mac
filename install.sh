#!/bin/sh
brew install ack
brew install git
brew install fasd
brew install httpie
brew install lua
brew install luarocks
brew install caskroom/cask/brew-cask

brew cask install mjolnir

luarocks install mjolnir.application
luarocks install mjolnir.hotkey
luarocks install mjolnir.window
luarocks install mjolnir.fnutils
luarocks install mjolnir.alert
luarocks install mjolnir.cmsj.appfinder
luarocks install mjolnir.screen

~/dotfiles-mac/links.sh

