currentRelease = 3.24.2
nextRelease = 3.24.3
gpgkey=47CBC05C
lauruxPosRelease = $(shell wget --quiet https://github.com/Laurux/Laurux-Pos/raw/master/.project -O - | grep ^Version | sed -e s/Version=//)

all: release-check

update : release-new orig-pkg release-src release-bin release-ppa

release-new:
	@mv laurux-pos_$(currentRelease) laurux-pos_$(nextRelease)
	@perl -pi -e "s/$(currentRelease)/$(nextRelease)/" laurux-pos_$(nextRelease)/laurux-pos
	@cd laurux-pos_$(nextRelease)/ && make deep-clean
	@cd laurux-pos_$(nextRelease) && dch -i
	@tar cjvf laurux-pos_$(nextRelease).tar.bz2 laurux-pos_$(nextRelease)
	@cd laurux-pos_$(nextRelease)/ && make dl
	@perl -pi -e "s/^lauruxrelease.+/lauruxrelease=$(lauruxPosRelease)/" laurux-pos_$(nextRelease)/laurux-pos

clean:
	@rm laurux-pos_$(nextRelease)-1_*
	@rm *.orig.tar.*

release-check:
	@echo -n "Getting release version from Laurux-Pos GIT Repo : "
	@wget --quiet https://github.com/Laurux/Laurux-Pos/raw/master/.project -O - | grep ^Version | sed -e s/Version=// >laurux-posSrcRelease.txt
	@echo "done"
	@echo
	@echo -n "	You need to ";
	@diff laurux-posSrcRelease.txt laurux-posBinRelease.txt 2>&1 >/dev/null; if [ $$? -eq 1 ]; then echo "update : vi Makefile && make update"; else echo "sleep"; fi
	@echo

orig-pkg:
	cd laurux-pos_$(nextRelease) && make
	tar czvf laurux-pos_$(nextRelease).orig.tar.gz laurux-pos_$(nextRelease)

release-src:
	cd laurux-pos_$(nextRelease) && debuild -S -sa -k$(gpgkey)

release-update:
	cd laurux-pos_$(nextRelease) && debuild -S -sd -k$(gpgkey)

release-bin:
	cd laurux-pos_$(nextRelease) && make
	cd laurux-pos_$(nextRelease) && debuild -i -b -us -uc

release-ppa:
	dput ppa:freddy-f/ppa laurux-pos_$(nextRelease)-1_source.changes
	cp laurux-posSrcRelease.txt laurux-posBinRelease.txt
