PORT ?= 3000
bundle := bundle

start: bundle
	${bundle} exec jekyll serve --safe --watch --port ${PORT}

# Incremental building is faster, but more fragile
start-incremental: bundle
	${bundle} exec jekyll serve --safe --drafts --watch --incremental --port ${PORT}

build: bundle
	${bundle} exec jekyll build

bundle:
	${bundle}

# Print tags
tags:
	grep "tags:" _posts/*.md -h | sort | uniq
