# Laurux deb package builder

you can use this data to build a laurux package for your debian
system that will allow you to enable multiuser usage of the laurux
application.

## Download this repository

	git clone https://github.com/ffrouin/laurux

rename the deb-package-builder directory

	cd laurux
	mv deb-package-builder laurux_0.1

## Download the latest release of Laurux

	make download

## Create your laurux deb file

	make package

## Install your new package

	sudo dpkg -i ../laurux_0.1-1_all.deb

## Start Laurux

	laurux
