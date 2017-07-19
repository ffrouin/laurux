# Laurux debian package builder

Laurux is an application designed for french companies or professional
individuals that need an application to manage their business : commercial,
billing, french accounting, point of sale.

Any information about laurux (french technology) : [Laurux Website](http://www.laurux.fr)

You can use this data to build a laurux package for your debian
system. This package will allow you to enable multiuser usage of
the laurux application originaly designed for a single user usage.

## Download this repository

	git clone https://github.com/ffrouin/laurux

enter the deb package builder directory

	cd laurux/laurux_0.1

## Download the latest release of Laurux

	make download

## Create your laurux deb file

	make package

## Install your new package

	sudo dpkg -i ../laurux_0.1-1_all.deb

## Start Laurux

	laurux
