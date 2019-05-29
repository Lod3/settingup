#!/bin/bash

echo hello, linux here, setting you up. 

sleep 1

echo Phase 1 APT 

sleep 1

sudo apt install flatpak shutter filezilla vim wget curl openvpn 

echo Phase 2 non APT, Visual Code, Signal, Shift, GIMP etc

sudo apt update

sudo apt install software-properties-common apt-transport-https

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt install code

flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref

curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -

echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt install signal-desktop

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"

sudo apt update
sudo apt install virtualbox-6.0

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

curl https://rclone.org/install.sh | sudo bash

wget -P ~/Downloads/ https://www.dropbox.com/s/ts7caly2u4kbkfb/shift-linux.zip?dl=0