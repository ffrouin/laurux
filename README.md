# Laurux debian package builder for Ubuntu PPA

Laurux is an application designed for french companies or professional
individuals that need an application to manage their business : commercial,
billing, french accounting, point of sale.

You can use this data to build a laurux package for your debian
system. This package will allow you to enable multiuser usage of
the laurux application originaly designed for a single user usage.

Laurux is designed as 3 majors modules :
	- Laurux : Commercial, Billing, Accounting, Stock,
	- Laurux Pos : Connected POS (stock management),
	- LXPos : An autonomous POS (no stock management / small shops or profesionnal individuals)

Any information about laurux (french) : [Laurux Website](http://www.laurux.fr)

## Connect our PPA to get laurux from your Ubuntu System

### First connect to the gambas3 team ppa and install gambas3

	sudo add-apt-repository ppa:gambas-team/gambas3
	sudo apt-get update
	sudo apt-get install gambas3

### Then connect to our ppa and deploy laurux

	sudo add-apt-repository ppa:freddy-f/ppa
	sudo apt-get update
	sudo apt-get install laurux laurux-pos lxpos

## You prefer build your own debian package

If you just want try this package before creating it, you may jump
to section 4 directly. This repository contain the last build I made
on i386 before to publish this data (tested on Ubuntu 14.04 LTS).

Install required system packages:

	sudo apt-get install devscripts build-essential lintian

### 1. Download this repository

	git clone https://github.com/ffrouin/laurux/laurux

enter the deb package builder directory

	cd laurux

### 2. Download the latest release of Laurux

	cd laurux_0.14
	make dl && make

### 3. Create your laurux deb file

	cd ..
	make release-bin

### 4. Install your new package

	sudo dpkg -i laurux_0.14-1ubuntu1_i386.deb

### 5. Start Laurux

	laurux

