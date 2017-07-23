currentRelease = 0.12
nextRelease = 0.13
lauruxRelease = 3.64
gpgkey=47CBC05C

all:
	mv laurux_$(currentRelease) laurux_$(nextRelease)
	perl -pi -e "s/$(currentRelease)/$(nextRelease)/" laurux_$(nextRelease)/laurux
	perl -pi -e "s/lauruxrelease=.+/lauruxrelease=$(lauruxRelease)/" laurux_$(nextRelease)/laurux

orig-pkg:
	cd laurux_$(nextRelease) && make dl && make
	tar czvf laurux_$(nextRelease).orig.tar.gz laurux_$(nextRelease)

release-new:
	cd laurux_$(nextRelease) && debuild -S -sa -k$(gpgkey)

release-update:
	cd laurux_$(nextRelease) && debuild -S -sd -k$(gpgkey)

release-bin:
	cd laurux_$(nextRelease) && debuild -i -b -us -uc

release-publish:
	dput ppa:freddy-f/ppa laurux_$(nextRelease)-1ubuntu1_source.changes
