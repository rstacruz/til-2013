---
title: Speed up MacVim with Lua
description: Make your OSX Vim experience better with this simple switch.
tags: [Development]
---

It's always a good idea to install [MacVim](https://github.com/b4winckler/macvim) with Lua support. [Homebrew](http://brew.sh/) does not compile with Lua support by default. This gets you the benefit of a noticeably-faster [Unite.vim](https://github.com/Shougo/unite.vim).

```
brew install macvim --with-cscope --with-lua --override-system-vim --with-luajit --with-python3
```
{:.terminal.wide}

The option `--override-system-vim` will allow you to use `vim` in the command line apart from the GUI... also a great idea.
