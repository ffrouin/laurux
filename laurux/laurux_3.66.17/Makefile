prefix = /usr
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

all: laurux3

laurux3:
	cd Laurux && gbc3 -agt && gba3 -o ../Laurux3/Laurux3.gambas
	cd Serveur-Maj && gbc3 -agt && gba3 -o ../Laurux3/Serveur-Maj.gambas

dl: dl-laurux-sources dl-laurux-bin

dl-laurux-sources:
	git clone https://github.com/Laurux/Laurux
	git clone https://github.com/Laurux/Serveur-Maj

dl-laurux-bin:
	wget http://www.laurux.fr/file/Laurux3.tar.gz
	tar xzvf Laurux3.tar.gz
	rm Laurux3.tar.gz
	rm Laurux3/Laurux3.gambas
	rm Laurux3/Serveur-Maj.gambas

clean:
	rm Laurux3/Laurux3.gambas
	rm Laurux3/Serveur-Maj.gambas
	rm -rf Laurux/.gambas
	rm -rf Laurux/.lang
	rm -rf Serveur-Maj/.gambas
	rm -rf Serveur-Maj/.lang

deep-clean:
	rm -rf Laurux3 Serveur-Maj Laurux
	rm -rf debian/laurux

install:

