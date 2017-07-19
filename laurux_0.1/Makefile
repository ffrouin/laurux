prefix = /usr/local
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

all:

download:
	wget http://www.laurux.fr/file/Laurux3.tar.gz
	tar xzvf Laurux3.tar.gz
	rm Laurux3.tar.gz
	cd ../ && tar czvf laurux_0.1.orig.tar.gz laurux_0.1

clean:

install:

package:
	debuild -i -us -uc	
