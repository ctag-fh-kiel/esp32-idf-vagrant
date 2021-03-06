#!/usr/bin/env bash

# update system
apt-get update
apt-get upgrade -y
# setup ttyusb
# https://askubuntu.com/questions/935350/ubuntu-16-04-1-usbserial-missing/984031
apt-get install -y linux-image-extra-virtual wget unzip tar

# Install basic development tools
#sudo apt-get install -y libusb-1.0-0 libusb-1.0-0-dev libftdi1 libftdi-dev 

# Install basic development tools
apt-get install -y git make libncurses-dev flex bison gperf python python-serial python-pip python-dev build-essential gcc g++ linux-headers-$(uname -r)

# Allow non-root users to access USB devices
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="10C4", ATTRS{idProduct}=="EA60", GROUP="users", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules
echo 'KERNEL=="ttyUSB0", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules
sudo udevadm control --reload-rules
sudo udevadm trigger

# Install toolchain for esp32 and set up environment variables
cd /home/vagrant

wget -nv https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
echo "export PATH=\"$PATH:/home/vagrant/xtensa-esp32-elf/bin:/home/vagrant/esp32ulp-elf-binutils/bin\"" >> .bash_profile 
git clone --recursive https://github.com/espressif/esp-idf.git
echo "export IDF_PATH=/home/vagrant/esp-idf" >> .bash_profile
pip install --upgrade pip
cd /home/vagrant/esp-idf
git checkout release/v3.2
git submodule update
python -m pip install --user -r /home/vagrant/esp-idf/requirements.txt
cd /home/vagrant
wget -nv https://github.com/espressif/binutils-esp32ulp/releases/download/v2.28.51-esp32ulp-20180809/binutils-esp32ulp-linux64-2.28.51-esp32ulp-20180809.tar.gz
tar xf binutils-esp32ulp-linux64-2.28.51-esp32ulp-20180809.tar.gz

# create esp dir
mkdir host/esp-src
cp -r esp-idf/examples/get-started host/esp-src
chown vagrant:vagrant -R /home/vagrant

# node.js v8
cd ~
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# German layouts
# switch to German keyboard layout in gnome desktop
dbus-launch --exit-with-session gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'de'), ('xkb', 'us')]"

# switch to German keyboard layout for console
export DEBIAN_FRONTEND=noninteractive
sed -i 's/"us"/"de"/g' /etc/default/keyboard
apt-get install -y console-common
install-keymap de

# set timezone to German timezone
echo 'Europe/Zurich' > /etc/timezone 
rm /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

