#!/bin/bash


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

read -P "Installing gui Applications, chrome, vlc, libreoffice, visual-studio-code, filezilla, shift"

brew cask install google-chrome

brew cask install vlc 

brew cask install libreoffice

brew cask install visual-studio-code

brew cask install filezilla

read -p "Download shift? y or n [yn]" answer
if [[ $answer = y ]] ; then 
  wget -P ~/Downloads/ https://www.dropbox.com/s/s3n16wjbsqnehv6/shift-mac.dmg
fi

read -p "Trying to mount shift.dmg and install" 

sudo sudo hdiutil attach ~/Downloads/shift-mac.dmg

sudo cp -R /Volumes/shift-mac/shift.app /Applications

