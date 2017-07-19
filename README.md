# Laurux deb package builder

you can use this data to build a laurux package for your debian
system that will allow you to enable multiuser usage of the laurux
application.

## Download this repository

	git clone https://github.com/ffrouin/laurux

enter the deb package builder directory

	cd laurux/laurux_0.1

## Download the latest release of Laurux we need in package

	make download

## Create your laurux deb file

	make package

## Install your new package

	sudo dpkg -i ../laurux_0.1-1_all.deb

## Start Laurux

	laurux
