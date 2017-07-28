prefix = /usr
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

all: lxpos-bin

lxpos-bin:
	cd LX-Pos && gbc3 -agt && gba3 -o ../LX.pos/LXPos.gambas

dl: dl-lxpos-sources dl-lxpos-bin

dl-lxpos-sources:
	git clone https://github.com/Laurux/LX-Pos

dl-lxpos-bin:
	wget http://www.laurux.fr/file/LX.pos.tar.gz
	tar xzvf LX.pos.tar.gz
	rm LX.pos.tar.gz

clean:
	rm LX.pos/LXPos.gambas
	rm -rf LX-pos/.gambas
	rm -rf LX-pos/.lang

deep-clean:
	rm -rf LX-Pos LX.pos
	rm -rf debian/lxpos

install:

