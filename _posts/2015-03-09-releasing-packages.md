---
title: Tools to make releasing packages easier
date: 2015/03/09
tags: [Development]
description: Make releasing packages easier with these 2 open-source tools.
image: https://camo.githubusercontent.com/b35364114a530e5b4066d719c150d7abaaf4e95f/687474703a2f2f63646e2e7261776769742e636f6d2f727374616372757a2f62756d702d636c692f613235316336332f62756d702e706e67
---
Releasing packages involves the same repetitive tasks: updating the change log, bumping versions, tagging a release, and so on. Here are a few tools to make this chore easier.
{:.brief-intro.center}

![]({{ page.image }})
{:.full-image.cropped.bottom-space-2}

### 1. Bump versions via [bump-cli](http://npmjs.com/bump-cli)
This utility allows you to increment versions of files through the command line. For JavaScript packages, this simply means bumping your `.json` files. This works with any file type with [semver](http://semver.org/) tags.

### 2. Continuously maintain the change log
There are many change log tools available, but I've found that the sanest solution is to update the log as features get implemented. Maintain an "unreleased" list on top of the change log—on release time, you'll simply need to add a date.

```
## v0.1.0 - unreleased

* Added feature Y
* Fixed bug Z
* ...
```

### 3. Tag and release via [git-extras](https://github.com/tj/git-extras)

Git Extras comes with the `git release` command, which automates creating a release commit, tags it with the right version, and pushes it.

```sh
git release "v1.0.0"
```
{:.terminal.large.cursor}


## All together now
{:.top-space-2.bottom-space-0}

Here's how it would work for a typical [npm](http://npmjs.com) package. These tools are language-agnostic, though—this process will also work for non-JavaScript packages.

```sh
vim HISTORY.md
bump *.json &&
npm test &&            # Run tests
npm publish &&         # Publish to npm
git release "v1.0.0"   # Publish to GitHub
```
