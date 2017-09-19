PORT ?= 3000
bundle := env BUNDLE_GEMFILE=./_/Gemfile bundle

start: bundle
	${bundle} exec jekyll serve --safe --drafts --watch --incremental --port ${PORT}

build: bundle
	${bundle} exec jekyll build

bundle:
	${bundle}

# Print tags
tags:
	grep "tags:" _posts/*.md -h | sort | uniq
