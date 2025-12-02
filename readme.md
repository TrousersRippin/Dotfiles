# My Dotfiles

This repository contains the dotfiles for my Linux environment and scripts to install the software.

# Requirements

Ensure you have Git installed and sudo permissions on your system. The scripts will check and install any other software requirements.

# Installation

Pull the dotfiles repo into your home folder and run the install script for your distibution.
```bash
git clone --quiet https://github.com/trousersrippin/dotfiles.git
```
Debian
```bash
./dotfiles/install_debian.sh
```
RHEL/CentOS/Fedora
```bash
./dotfiles/install_rhel.sh
```
openSUSE
```bash
./dotfiles/install_suse.sh
```
Ubuntu
```bash
./dotfiles/install_ubuntu.sh
```