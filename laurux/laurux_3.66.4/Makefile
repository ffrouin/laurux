prefix = /usr
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

all: laurux3

laurux3:
	cd Laurux && gbc3 -agt && gba3 -o ../Laurux3/Laurux3.gambas

dl: dl-laurux-sources dl-laurux-bin

dl-laurux-sources:
	git clone https://github.com/Laurux/Laurux

dl-laurux-bin:
	wget http://www.laurux.fr/file/Laurux3.tar.gz
	tar xzvf Laurux3.tar.gz
	rm Laurux3.tar.gz
	rm Laurux3/Laurux3.gambas
	rm Laurux3/Serveur-Maj.gambas

clean:
	rm Laurux3/Laurux3.gambas
	rm -rf Laurux/.gambas
	rm -rf Laurux/.lang

deep-clean:
	rm -rf Laurux3 Laurux
	rm -rf debian/laurux

install:

