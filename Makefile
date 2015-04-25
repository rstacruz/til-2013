PORT ?= 3000
bundle := env BUNDLE_GEMFILE=./_/Gemfile bundle
nom := ./node_modules/.bin

start: bundle
	${bundle} exec jekyll serve --safe --drafts --watch --port ${PORT}

bs: bundle
	${nom}/multiexec "${bundle} exec jekyll build --watch" "${nom}/browser-sync start --server _site --files='_site/*, _site/*/*'"

build: bundle
	${bundle} exec jekyll build

bundle:
	${bundle}
	if [ ! -x ${nom}/multiexec ]; then npm install multiexec; fi
	if [ ! -x ${nom}/browser-sync ]; then npm install browser-sync; fi
