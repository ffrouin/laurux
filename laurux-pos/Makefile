currentRelease = 0.1
nextRelease = 0.2
gpgkey=47CBC05C
lauruxRelease = $(shell wget --quiet https://github.com/Laurux/Laurux/raw/master/.Version -O -)

all:
	@mv laurux-pos_$(currentRelease) laurux-pos_$(nextRelease)
	@perl -pi -e "s/$(currentRelease)/$(nextRelease)/" laurux-pos_$(nextRelease)/laurux-pos
	@cd laurux-pos_$(nextRelease)/ && make deep-clean
	@cd laurux-pos_$(nextRelease) && dch -i
	@tar cjvf laurux-pos_$(nextRelease).tar.bz2 laurux-pos_$(nextRelease)
	@cd laurux-pos_$(nextRelease)/ && make dl
#	@perl -pi -e "s/^lauruxrelease.+/lauruxrelease=$(lauruxRelease)/" laurux-pos_$(nextRelease)/laurux-pos

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
	cd laurux-pos_$(nextRelease) && make
	tar czvf laurux-pos_$(nextRelease).orig.tar.gz laurux-pos_$(nextRelease)

release-new:
	cd laurux-pos_$(nextRelease) && debuild -S -sa -k$(gpgkey)

release-update:
	cd laurux-pos_$(nextRelease) && debuild -S -sd -k$(gpgkey)

release-bin:
	cd laurux-pos_$(nextRelease) && make
	cd laurux-pos_$(nextRelease) && debuild -i -b -us -uc

release-ppa:
	dput ppa:freddy-f/ppa laurux-pos_$(nextRelease)-1ubuntu1_source.changes
	cp lauruxSrcRelease.txt lauruxBinRelease.txt
