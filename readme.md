# ESP32 Vagrant

Creates development environment for esp32 idf with Vagrant using a VirtualBox VM

## Prerequisites

Download and install:
* https://git-scm.com/downloads
* https://www.virtualbox.org/wiki/Downloads and extensions (same page)
* https://www.vagrantup.com/
* start Git Bash
* clone this repository
* [alternative] GUI: if you want a VM with GUI uncomment relevant lines in Vagrantfile

## Creating VM

* cd esp32-idf-vagrant
* vagrant up
* vagrant reload
* vagrant ssh
* [alternative] GUI: login from virtual box , usr: vagrant pwd: vagrant , startx

Your host file system is visible in ~/host

## Authors

* Robert Manzke

## License

This project is licensed under the MIT License

## Acknowledgments

* Based on https://github.com/pichenettes/mutable-dev-environment

