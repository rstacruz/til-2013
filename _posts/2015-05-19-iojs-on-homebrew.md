---
title: Installing iojs on homebrew
tags: [OSX]
image: images/iojs-linking.png
description: Here's how to get iojs on OSX using Homebrew.
---

![Image]({{ page.image }}){:style='max-width:500px'}
{:.full-image.cropped.bottom-space-4}

Simply doing `brew install iojs` is not enough. To get iojs working on [Homebrew] You will need to unlink `node` first then use `link --force` to install iojs.

```
brew install iojs
brew unlink node
brew link iojs --force
```
{:.terminal}

[Homebrew]: http://brew.sh/
