currentRelease = 0.5
nextRelease = 1.4.10
gpgkey=47CBC05C
lxposRelease = $(shell wget --quiet https://github.com/Laurux/LX-Pos/raw/master/.project -O - | grep ^Version | sed -e s/Version=//)

all: release-check

update: release-new orig-pkg release-src release-bin release-ppa

release-new:
	@mv lxpos_$(currentRelease) lxpos_$(nextRelease)
	@perl -pi -e "s/$(currentRelease)/$(nextRelease)/" lxpos_$(nextRelease)/lxpos
	@cd lxpos_$(nextRelease)/ && make deep-clean
	@cd lxpos_$(nextRelease) && dch -i
	@tar cjvf lxpos_$(nextRelease).tar.bz2 lxpos_$(nextRelease)
	@cd lxpos_$(nextRelease)/ && make dl
	@perl -pi -e "s/^lauruxrelease.+/lauruxrelease=$(lxposRelease)/" lxpos_$(nextRelease)/lxpos

clean:
	@rm lxpos_$(nextRelease)-1_*
	@rm *.orig.tar.*

release-check:
	@echo -n "Getting release version from LX Pos GIT Repo : "
	@wget --quiet https://github.com/Laurux/LX-Pos/raw/master/.project -O - | grep ^Version | sed -e s/Version=// >lxposSrcRelease.txt
	@echo "done"
	@echo
	@echo -n "	You need to ";
	@diff lxposSrcRelease.txt lxposBinRelease.txt 2>&1 >/dev/null; if [ $$? -eq 1 ]; then echo "update : vi Makefile && make update"; else echo "sleep"; fi
	@echo

orig-pkg:
	cd lxpos_$(nextRelease) && make
	tar czvf lxpos_$(nextRelease).orig.tar.gz lxpos_$(nextRelease)

release-src:
	cd lxpos_$(nextRelease) && debuild -S -sa -k$(gpgkey)

release-update:
	cd lxpos_$(nextRelease) && debuild -S -sd -k$(gpgkey)

release-bin:
	cd lxpos_$(nextRelease) && make
	cd lxpos_$(nextRelease) && debuild -i -b -us -uc

release-ppa:
	dput ppa:freddy-f/ppa lxpos_$(nextRelease)-1_source.changes
	cp lxposSrcRelease.txt lxposBinRelease.txt
