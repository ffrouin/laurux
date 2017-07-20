# Laurux debian package builder

Laurux is an application designed for french companies or professional
individuals that need an application to manage their business : commercial,
billing, french accounting, point of sale.

Any information about laurux (french technology) : [Laurux Website](http://www.laurux.fr)

You can use this data to build a laurux package for your debian
system. This package will allow you to enable multiuser usage of
the laurux application originaly designed for a single user usage.

If you just want try this package before creating it, you may jump
to section 4 directly. This repository contain the last build I made
before to publish this data (tested on Ubuntu 14.04 LTS).

Otherwise, you may want to use our ppa to be able de deploy laurux :

	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 47CBC05C
	add-apt-repository ppa:freddy-f/ppa
	apt-get update && apt-get install laurux

## 1. Download this repository

	git clone https://github.com/ffrouin/laurux

enter the deb package builder directory

	cd laurux/laurux_0.1

## 2. Download the latest release of Laurux

	make download

## 3. Create your laurux deb file

	make package
	cd ../

## 4. Install your new package

	sudo dpkg -i laurux_0.1-1_all.deb

## 5. Start Laurux

	laurux

