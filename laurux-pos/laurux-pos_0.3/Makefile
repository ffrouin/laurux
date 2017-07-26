prefix = /usr
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

all: laurux3

laurux3:
	cd Laurux-Pos && gbc3 -agt && gba3 -o ../Laurux.Pos/Laurux3-pos.gambas

dl: dl-laurux-pos-sources dl-laurux-pos-bin

dl-laurux-pos-sources:
	git clone https://github.com/Laurux/Laurux-Pos

dl-laurux-pos-bin:
	wget http://www.laurux.fr/file/Laurux.Pos.tar.gz
	tar xzvf Laurux.Pos.tar.gz
	rm Laurux.Pos.tar.gz
	rm Laurux.Pos/Laurux3-pos.gambas

clean:
	rm Laurux.Pos/Laurux3-pos.gambas
	rm -rf Laurux.Pos/.gambas
	rm -rf Laurux.Pos/.lang

deep-clean:
	rm -rf Laurux.Pos Laurux-Pos
	rm -rf debian/laurux-pos

install:

