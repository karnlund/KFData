VERSION = $(shell git describe --tags)
APPLEDOC ?= appledoc
APPLEDOC_OPTS = --output docs \
				--project-company "Kyle Fuller" \
				--company-id "com.kylefuller" \
			   	--project-name KFData \
				--project-version "$(VERSION)" \
				--create-html \
				--no-repeat-first-par \
				--keep-intermediate-files \
				--docset-platform-family iphoneos \
				--docset-atom-filename "KFData.atom" \
				--docset-feed-url "http://kylef.github.com/KFData/%DOCSETATOMFILENAME" \
				--docset-package-url "http://kylef.github.com/KFData/%DOCSETATOMFILENAME" \
				--docset-fallback-url "http://kylef.github.com/KFData/" \
				--publish-docset \
				--verbose 2

docs: clean
	$(APPLEDOC) $(APPLEDOC_OPTS) Classes Categories

clean:
	rm -fr docs

gh-pages: docs
	cp -r docs/publish/ docs/html
	ghp-import docs/html
