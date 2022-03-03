# Makefile for easy dotfile management
# :: inspired by these dot files
#	https://github.com/masasam/dotfiles
# :: Remarks
#	- Thanks to Gavin Freeborn (https://www.youtube.com/watch?v=aP8eggU2CaU)
#		for this idea!
#	- I'm still working on making this more dynamic, but this seems good
#	- Currently designed primarily for my linux dotfiles

#===========
# Variables
#===========

ifeq ($(OS),Windows_NT)
    # Windows-specific
    BASE=$(CD)
    HOME=$(HOMEDIR)
else
    # Other OS
    BASE = $(PWD)
    HOME = $(HOME)
    SCRIPTS = $(HOME)/.scripts
    MKDIR = mkdir -p		# Making directories with Parents
    LN = ln -vsf		# Symlink
    LNDIR = ln -vs 		# Symlink output directory

    # Distro Specific
    PKGINSTALL = sudo pacman --noconfirm -S
endif

PREFIX=/usr/local
MANPREFIX = $(PREFIX)/share/man
TMPDIR = $(PWD)/tmp

sudo_env = sudo -E		# Keep environment variables

#=============================
# Base/Post Installation ToDo
#=============================

postinstall: ## Setups after Base Installation
    # stop asking for password when using sudo
    sudo sed --in-place 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers

#================
# Installations
#================

# [Required packages]
basepkgs: ## Packages required for Base/Post Installs
    networkmanager


# [Package Installation]
base: ## Recipe/Instructions for Installation of Base Installation-related packages
    $(PKGINSTALL) $(basepkgs)

#=======
# Setup
#=======

# [Configs/Ricing]

sudo: ## stop asking for password when using sudo
    # Manual: sudo echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
    sudo sed -i 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers

vim: ## Recipe/Instructions for Vim config ricing
    $(SCRIPTS)

tlp: ## Setting for power saving and preventing battery deterioration
    $(PKGINSTALL) tlp powertop
    sudo $(LN) $(PWD)/etc/default/tlp /etc/default/tlp
    systemctl enable tlp.service
    systemctl enable tlp-sleep.service

networkmanager: ## Handles Network Management
    # sudo pacman -S --needed networkmanager
    sudo systemctl enable NetworkManager.service
    sudo systemctl start NetworkManager.service
    sudo $(MKDIR) /etc/NetworkManager

suspend: ## To control when device goes into suspension/hibernation
    sudo $(LN) $(PWD)/etc/systemd.logind.conf /etc/systemd/logind.conf

bluetooth: ## Bluetooth
    $(PKGINSTALL) bluez-utils pulseaudio-bluetooth pulseaudio-alsa blueman
    sudo $(LN) $(PWD)/etc/bluetooth/main.conf /etc/bluetooth/main.conf
    sudo systemctl start bluetooth.service
    sudo systemctl enable bluetooth.service

#==================
# Distro-Specific
#==================

# [ArchLinux]
pacmancolors: ## Make pacman and yay colorful and adds eye candy on the progress bar because why not
    sudo sed -i "s/^#Color/Color/" /etc/pacman.conf
    sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
    
#=======
# Main
#=======

initdotfiles: ## Initial dotfiles deployment
    $(LN) $(PWD)/.bashrc $(HOME)/.bashrc
    $(LN) $(PWD)/.bash_profile $(HOME)/.bash_profile
    $(LN) $(PWD)/.profile $(HOME)/.profile
    $(LN) $(PWD)/.xinitrc $(HOME)/.xinitrc
    $(LN) $(PWD)/.xResources $(HOME)/.xResources
    $(LN) $(PWD)/.zshrc $(HOME)/.zshrc
    $(LN) $(PWD)/.zprofile $(HOME)/.zprofile

#========
# Others
#========

init: ## Initialization & Deployment
    make -s initdotfiles

clean:
    $(RM) $(call FixPath,objs/*)