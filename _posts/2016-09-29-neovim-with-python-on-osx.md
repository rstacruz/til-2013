---
title: Neovim with Python on OSX
tags: [Development]
description: Here's how you can set up Neovim with Python support on OSX.
---

Want to use plugins like [Deoplete](https://github.com/Shougo/deoplete.nvim), [Hyperstyle](http://ricostacruz.com/vim-hyperstyle) and other Python plugins on OSX, you need a working installation of both Python2 and Python3 managed by Homebrew (ie, system default Python isn't enough).

```bash
brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade
```

To complete this, add this to your `~/.config/nvim/init.vim`:

```vim
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
```

And of course, you have to have Neovim installed for this. The repo [homebrew-neovim](https://github.com/neovim/homebrew-neovim) has all the info on how to do this.

```bash
brew install neovim/neovim/neovim
```

## Troubleshooting

You can use the `:HealthCheck` command to see issues with your Python providers.
