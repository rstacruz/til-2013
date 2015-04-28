---
title: Navigate code like a pro with Ctags
description: Move through code fast. Set up Ctags. Here's how.
tags: [Vim, Ctags]
image: images/unite-ctags.png
---

[Ctags] lets you navigate code fast, and is perhaps the single most useful productivity boosting tool in any developer's arsenal. If you're not using Ctags yet, let's get you started.
{:.brief-intro.center}

![Image](./images/unite-ctags.png){:style='max-width:900px;margin-bottom:-100px'}
{:.full-image.cropped.bottom-space-4}

## What's it for?

Ctags indexes a project's *tags*, or names of its classes and methods. Coupled with some integration with your editor (shown: Vim's [unite-tag]), it will give you two interesting features to help you traverse code base:

1. Jump to where any class, module, method, or function is defined given its name. In vim, that's `:tag`.

2. Place your cursor on a word, and jump to where it's defined with one keystroke. In vim, that's `^]`.

## Installing Ctags

### Exuberant Ctags
In OS X, use Homebrew to install [Exuberant Ctags][Ctags]. This is a more useful version of ctags than the one that ships with Xcode.

    brew install ctags

### Ctags options
Let's make ctags ignore some common directories. Save this file as `~/.ctags`.

    --recurse=yes
    --exclude=.git
    --exclude=vendor/*
    --exclude=node_modules/*
    --exclude=db/*
    --exclude=log/*

### Generate ctags for a project
Go to your project's path, and run ctags to generate a `tags` file in your project. This is the index of all tags in your project that your editor will use.

    ctags .

### Ignore all ctags files
It's safe to make all projects ignore all files called `tags`. I recommend setting up a global git ignore list.

    echo "tags" >> ~/.global_ignore
    git config --global core.excludesfile $HOME/.global_ignore

<br>

Vim setup
---------

### Auto-update ctags files
Use [vim-autotag] to automatically update `tags` files. This will only work on projects that have already had `ctags -R` performed before.

    Plug 'craigemery/vim-autotag'

### Jumping to tags

Use `:tag` to go to the definition of a certain tag. Usually, you will want to use this to jump to a certain Class or Method. Yes, this supports tab completion!

```
:tag ClassName
```

### From the command line
Use `vim -t` to open vim to a certain tag.

```
vim -t <tag>
```

### Navigating through multiple definition
If you used `:tag` on a tag that's got multiple definitions, use these commands to sift through them all.

| Shortcut | Definition |
| ---- | ---- |
| `:tn` | Move to next definition (`:tnext`) |
| `:tp` | Move to previous definition (`:tprevious`) |
| `:ts` | List all definitions (`:tselect`) |
{:.shortcuts}

### Key shortcuts
You can also place your cursor on some text and press `^]` to jump to that tag.

| Shortcut | Definition |
| ---- | ---- |
| `^]` | Jump to definition |
| `^t` | Jump back from definition |
| `^W` `}` | Preview definition |
| `g]` | See all definitions |
{:.shortcuts}

### Unite integration
If you're using [unite.vim], you can use [unite-tag] to browse tags. You can also check out my plugin, [vim-fastunite], which offers a pre-packaged distribution of Unite.vim.

    :Unite -start-insert tag

## Futher reading

* [Browsing programs with tags](http://vim.wikia.com/wiki/Browsing_programs_with_tags) (vim.wikia.com)

[vim-fastunite]: https://github.com/rstacruz/vim-fastunite
[vim-autotag]: https://github.com/craigemery/vim-autotag
[unite.vim]: https://github.com/Shougo/unite.vim
[unite-tag]: https://github.com/tsukkee/unite-tag
[Ctags]: http://ctags.sourceforge.net

