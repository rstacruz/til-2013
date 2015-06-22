---
title: Bundle your gems inside your project
description: Here's a tip to get the most out of your Ruby development experience.
tags: [Ruby]
---

When working on a Ruby project, I always put the files in `vendor/bundle/`. This has the benefit of having a greppable index of all the gems of your project, while keeping your global gemset tidy.

```
bundle install -j3 --path=vendor/bundle
```

This removes the need for managing gemsets via [rvm]. In fact, if your project always uses the latest Ruby (which you also should, in my opinion!), you won't even need rvm at all.

You only need to do this once in your project. The `--path` setting will be persisted in your project's Bundler configuration (`.bundle/config`).

Bonus: the `-j3` flag makes your installations faster by allowing 3 installs in parallel.

[rvm]: http://rvm.io/
