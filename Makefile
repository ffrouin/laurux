currentRelease = 0.13
nextRelease = 0.14
gpgkey=47CBC05C
lauruxRelease = $(shell wget --quiet https://github.com/Laurux/Laurux/raw/master/.Version -O -)

all:
	@mv laurux_$(currentRelease) laurux_$(nextRelease)
	@perl -pi -e "s/$(currentRelease)/$(nextRelease)/" laurux_$(nextRelease)/laurux
	@cd laurux_$(nextRelease)/ && make deep-clean
	@cd laurux_$(nextRelease) && dch -i
	@tar cjvf laurux_$(nextRelease).tar.bz2 laurux_$(nextRelease)
	@cd laurux_$(nextRelease)/ && make dl
	@perl -pi -e "s/^lauruxrelease.+/lauruxrelease=$(lauruxRelease)/" laurux_$(nextRelease)/laurux

clean:
	@rm *ubuntu*
	@rm *.orig.tar.*

release-check:
	@echo -n "Getting release version from Laurux GIT Repo : "
	@wget --quiet https://github.com/Laurux/Laurux/raw/master/.Version -O lauruxSrcRelease.txt
	@echo "done"
	@echo
	@echo -n "	You need to ";
	@diff lauruxSrcRelease.txt lauruxBinRelease.txt 2>&1 >/dev/null; if [ $$? -eq 1 ]; then echo "update"; else echo "sleep"; fi
	@echo

orig-pkg:
	cd laurux_$(nextRelease) && make
	tar czvf laurux_$(nextRelease).orig.tar.gz laurux_$(nextRelease)

release-new:
	cd laurux_$(nextRelease) && debuild -S -sa -k$(gpgkey)

release-update:
	cd laurux_$(nextRelease) && debuild -S -sd -k$(gpgkey)

release-bin:
	cd laurux_$(nextRelease) && make
	cd laurux_$(nextRelease) && debuild -i -b -us -uc

release-ppa:
	dput ppa:freddy-f/ppa laurux_$(nextRelease)-1ubuntu1_source.changes
	cp lauruxSrcRelease.txt lauruxBinRelease.txt
