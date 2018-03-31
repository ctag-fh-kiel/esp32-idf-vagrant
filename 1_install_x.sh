#!/usr/bin/env bash

cd ~

#install xfce4
apt-get install -y xfce4 xfce4-clipman xfce4-terminal midori virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
VBoxClient --clipboard
VBoxClient --draganddrop
VBoxClient --display
VBoxClient --checkhostversion
VBoxClient --seamless
sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config

#install vs code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt-get install -y code libxss1

# set timezone to German timezone
echo 'Europe/Zurich' > /etc/timezone 
rm /etc/localtime
dpkg-reconfigure -f noninteractive tzdata



