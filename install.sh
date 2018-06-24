#!/bin/bash

#
# Umbra AUR helper
# File: install.sh
#

echo -n "Checking if Git is installed..."
if [ -f /usr/bin/git ]
then
	echo " OK"
else
	echo " ERROR"
	echo "/usr/bin/git does not exist"
	exit 1
fi

echo -n "Checking if Curl is installed..."
if [ -f /usr/bin/curl ]
then
	echo " OK"
else
	echo " ERROR"
	echo "/usr/bin/curl does not exist"
	exit 1
fi

echo -n "Checking if Ruby is installed..."
if [ -f /usr/bin/ruby ]
then
	echo " OK"
else
	echo " ERROR"
	echo "/usr/bin/ruby does not exist"
	exit 1
fi

echo -n "Checking if MakePKG is installed..."
if [ -f /usr/bin/makepkg ]
then
	echo " OK"
else
	echo " ERROR"
	echo "/usr/bin/makepkg does not exist"
	exit 1
fi

sudo cp -v umbra /usr/bin/umbra
echo "Umbra was installed successfully"

echo "Creating configuration files..."
sudo mkdir -p /etc/umbra
sudo touch /etc/umbra/config
