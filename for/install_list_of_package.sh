#!/bin/bash
#install a list of package for ubuntu server via install-packages.txt file
#don't forget to put txt file
for package in $(cat install-packages.txt)
do
	sudo apt-get -y install $package
done

