currentRelease = 0.0
nextRelease = 0.1
gpgkey=47CBC05C
#lauruxRelease = $(shell wget --quiet https://github.com/Laurux/Laurux/raw/master/.Version -O -)

all:
	@mv lxpos_$(currentRelease) lxpos_$(nextRelease)
	@perl -pi -e "s/$(currentRelease)/$(nextRelease)/" lxpos_$(nextRelease)/lxpos
	@cd lxpos_$(nextRelease)/ && make deep-clean
	@cd lxpos_$(nextRelease) && dch -i
	@tar cjvf lxpos_$(nextRelease).tar.bz2 lxpos_$(nextRelease)
	@cd lxpos_$(nextRelease)/ && make dl
#	@perl -pi -e "s/^lauruxrelease.+/lauruxrelease=$(lauruxRelease)/" lxpos_$(nextRelease)/lxpos

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
	cd lxpos_$(nextRelease) && make
	tar czvf lxpos_$(nextRelease).orig.tar.gz lxpos_$(nextRelease)

release-new:
	cd lxpos_$(nextRelease) && debuild -S -sa -k$(gpgkey)

release-update:
	cd lxpos_$(nextRelease) && debuild -S -sd -k$(gpgkey)

release-bin:
	cd lxpos_$(nextRelease) && make
	cd lxpos_$(nextRelease) && debuild -i -b -us -uc

release-ppa:
	dput ppa:freddy-f/ppa lxpos_$(nextRelease)-1ubuntu1_source.changes
	cp lauruxSrcRelease.txt lauruxBinRelease.txt
