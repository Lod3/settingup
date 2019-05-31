#!/bin/bash

xcode-select --install

read -p "Install Brew $foo? [yn]" answer
if [[ $answer = y ]] ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

fi

if [ $? -eq 0 ]; then
    echo brew installed

else
    echo brew install failed, contact admin
fi

read -p "Need to install osxfuse, continue $foo? y or no [yn]" answer
if [[ $answer = y ]] ; then
  brew cask install osxfuse

fi

read -p "Install curl? y or n [yn]" answer
if [[ $answer = y ]] ; then
  brew install curl 
fi

read -p "Install wget? y or n [yn]" answer
if [[ $answer = y ]] ; then
  brew install wget 
fi

read -p "Install rclone? y or n [yn]" answer
if [[ $answer = y ]] ; then
  curl https://rclone.org/install.sh | sudo bash
fi

read -p "Installing gui Applications, chrome, vlc, libreoffice, visual-studio-code, filezilla, shift, gimp, the-unarchiver, continue? y or n [yn]" answer
if [[ $answer = y ]] ; then
  brew cask install google-chrome
  brew cask install vlc 
  brew cask install libreoffice
  brew cask install visual-studio-code
  brew cask install cyberduck
  brew cask install the-unarchiver
  brew cask install gimp
  brew cask install skype
  brew cask install steam
  brew cask install virtualbox
  brew cask install nano
  brew cask install vim
  brew cask install htop
  brew cask install nmap
  brew cask install unzip
  brew cask install 7zip
  brew cask install disk-inventory-x
  brew install node
  brew install tree

fi

read -p "cleaning up brew"
brew update && brew upgrade && brew cleanup && brew cask cleanup

read -p "Download shift? y or n [yn]" answer
if [[ $answer = y ]] ; then 
  wget -P ~/Downloads/ https://github.com/Lod3/settingup/raw/master/shift-mac.dmg
fi

read -p "Trying to mount shift.dmg and install" 

sudo sudo hdiutil attach ~/Downloads/shift-mac.dmg

sudo cp -R /Volumes/shift-mac/shift.app /Applications

read -p "Setting up system preferences"

echo "Reboot to a clean state set to true"
defaults write com.apple.systempreferences NSQuitAlwaysKeepWindows -bool false
echo "Ignore quarentine of unknown apps"
defaults write com.apple.LaunchServices LSQuarantine -bool false
echo "Invert scrolling direction"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
echo "Unhide "~/Library" folder."
chflags nohidden ~/Library
echo "Allow selecting text in Quick Look."
defaults write com.apple.finder QLEnableTextSelection -bool true
echo "Show path in Finder"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
echo "Show extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
