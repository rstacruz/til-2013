---
title: Installing iojs on Homebrew
tags: [OSX]
image: images/iojs-linking.png
description: Here's how to get iojs on OSX using Homebrew.
---

![Image]({{ page.image }}){:style='max-width:500px'}
{:.full-image.cropped.bottom-space-4}

An updated [homebrew-iojs] formula is maintained by [@aredridel] and is available with just one command.

```
brew install aredridel/iojs/iojs
```
{:.terminal}

----

### Default formula
As of iojs 2.0.2, Homebrew ships with its own formula for iojs. This isn't preferrable, in my opinion, since global npm packages aren't being ran properly.

If you'd like to use this anyway, simply doing `brew install iojs` is not enough. To get iojs working on [Homebrew] You will need to unlink `node` first then use `link --force` to install iojs.

```
brew install iojs
brew unlink node
brew link iojs --force
```
{:.terminal}

[homebrew-iojs]: https://github.com/aredridel/homebrew-iojs/blob/master/Formula/iojs.rb
[@aredridel]: https://github.com/aredridel
[Homebrew]: http://brew.sh/
