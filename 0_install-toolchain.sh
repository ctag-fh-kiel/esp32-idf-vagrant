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
apt-get install -y git make libncurses-dev flex bison gperf python python-serial

# Allow non-root users to access USB devices
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="10C4", ATTRS{idProduct}=="EA60", GROUP="users", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules
echo 'KERNEL=="ttyUSB0", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules
sudo udevadm control --reload-rules
sudo udevadm trigger

# Install toolchain for esp32 and set up environment variables
cd /home/vagrant

wget -nv https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
echo "export PATH=\"$PATH:/home/vagrant/xtensa-esp32-elf/bin\"" >> .bash_profile 
git clone --recursive https://github.com/espressif/esp-idf.git
echo "export IDF_PATH=/home/vagrant/esp-idf" >> .bash_profile

# create esp dir
mkdir host/esp
cp -r esp-idf/examples/wifi/scan host/esp
chown vagrant:vagrant -R /home/vagrant