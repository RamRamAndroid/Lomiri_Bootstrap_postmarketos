#!/bin/sh

if [ "$1" = "" ]
then
	echo "ERROR: No argument passed."
	echo "Valid Arguments:"
	echo "  --install (-i)"
	echo "  --uninstall (-u)"
	exit 1
fi

if [ "$1" = "-i" ] || [ "$1" = "--install" ]
then
	originaldir="${PWD}"
	echo "Setting up Lomiri pmaports!"
	# Move to pmaports directory
	cd "${HOME}/.local/var/pmbootstrap/cache_git/pmaports"
	# Update pmaports
	git pull
	# Add lomiri DE
        git checkout feature/lomiri
	echo "Lomiri setup complete! Make sure to select [y] in pmbootstrap when prompted if you want to build out of date packages.
	
	thanks for trying my bootstrap
	
	RamRam_Android (Ram Jammula)"
	cd "${originaldir}"
	exit 0
fi

if [ "$1" = "-u" ] || [ "$1" = "--uninstall" ]
then
	originaldir="${PWD}"
	echo "Removing Lomiri pmaports!"
	# Move to pmaports directory
	cd "${HOME}/.local/var/pmbootstrap/cache_git/"
	# Remove lomiri DE
	sudo rm -r pmaports
	# Update pmaports
	git clone https://gitlab.postmarketos.org/postmarketOS/pmaports.git
	echo "Uninstallation complete! You are now back to the base pmaports directory setup.
	
	thanks for trying my bootstrap 
	
	RamRam_Android (Ram Jammula)"
	cd "${originaldir}"
	exit 0
fi
	
