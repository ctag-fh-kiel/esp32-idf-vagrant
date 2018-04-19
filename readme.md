# ESP32 Vagrant

Creates development environment for esp32 idf with Vagrant using a VirtualBox VM

## Prerequisites

* Download and install:
	* https://git-scm.com/downloads
	* https://www.virtualbox.org/wiki/Downloads and !extensions! (same page)
	* https://www.vagrantup.com/
* Start Git Bash
* In Git Bash: Go to target folder (your choice, i.e. mkdir MyVMs, cd MyVMs)
* In Git Bash: Clone repository with git clone https://github.com/ctag-fh-kiel/esp32-idf-vagrant.git 
* [alternative] No GUI: if you do not want a VM with GUI comment relevant lines in Vagrantfile

## Creating VM

* After cloning in Git Bash change directory: cd esp32-idf-vagrant
* In Git Bash: vagrant up
* In Git Bash: vagrant reload
* Log into VirtualBox VM after VM has booted: user: vagrant password: vagrant
* After VM has rebooted log in and startx with: startx
* [alternative] No GUI in Git Bash log in via ssh in VM console with: vagrant ssh

Your host file system is visible in ~/host in client

## Authors

* Robert Manzke

## License

This project is licensed under the MIT License

## Acknowledgments

* Based on https://github.com/pichenettes/mutable-dev-environment

