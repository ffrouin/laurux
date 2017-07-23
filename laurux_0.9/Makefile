prefix = /usr
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

all: laurux3

laurux3:
	cd Laurux && gbc3 -agt && gba3 -o ../Laurux3/Laurux3.gambas
	rm -rf Laurux/.gambas
	rm -rf Laurux/.lang

dl-laurux-sources:
	git clone https://github.com/Laurux/Laurux

dl-laurux-bin:
	wget http://www.laurux.fr/file/Laurux3.tar.gz
	tar xzvf Laurux3.tar.gz
	rm Laurux3.tar.gz
	rm Laurux3/Laurux3.gambas
	rm Laurux3/Serveur-Maj.gambas

orig-pkg: dl-laurux-bin dl-laurux-sources laurux3
	cd ../ && tar czvf laurux_0.9.orig.tar.gz laurux_0.9

clean:
	rm Laurux3/Laurux3.gambas

deep-clean:
	rm -rf Laurux3 Laurux
	rm -rf debian/laurux

install: all

new-release: orig-pkg laurux3
	debuild -S -sa -k47CBC05C

update-release: laurux3
	debuild -S -sd -k47CBC05C

bin-release: laurux3
	debuild -i -b -us -uc

publish:
	cd ../ && dput ppa:freddy-f/ppa laurux_0.9-1ubuntu1_source.changes
