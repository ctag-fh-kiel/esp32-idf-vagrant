# ESP32 Vagrant

Creates development environment for ESP32 idf with Vagrant using a VirtualBox VM

## Prerequisites

* Download and install:
	* https://git-scm.com/downloads
	* https://www.virtualbox.org/wiki/Downloads and !extensions! (same page)
	* https://www.vagrantup.com/
* Start Git Bash
* In Git Bash
	* Go to target folder (your choice, i.e. mkdir MyVMs, cd MyVMs)
	* Clone repository with 
		* git clone https://github.com/ctag-fh-kiel/esp32-idf-vagrant.git 
* [alternative] No GUI: if you do not want a VM with GUI comment relevant lines in Vagrantfile

## Creating VM

* After cloning in Git Bash change directory: cd esp32-idf-vagrant
* In Git Bash: 
	* vagrant up
	* vagrant reload (reboots the VM, required at first use)
* Log into VirtualBox VM after VM has booted: user: vagrant password: vagrant
* After VM has rebooted log in and startx with: startx
* [alternative] No GUI in Git Bash log in via ssh in VM console with: vagrant ssh

## Remarks

* Your host file system is mounted in ~/host in client
* Use vagrant suspend to put VM asleep
* Use vagrant up to awake VM
* Use vagrant destroy to delete VM 
* Source code for ESP32 development may be put in host directory (may have issues with line feed) or client directory

## Authors

* Robert Manzke

## License

This project is licensed under the MIT License

## Acknowledgments

* Based on https://github.com/pichenettes/mutable-dev-environment

