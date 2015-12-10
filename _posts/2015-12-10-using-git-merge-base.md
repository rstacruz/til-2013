---
title: Use git merge-base for big merges
tags: [Development, Git]
description: Use this one command to help you with big Git merges.
---

When trying to merge two Git branches that have diverged a lot, it's a little difficult to make sense of what happened on both sides.

Enter [git merge-base]--a simple built-in utility to tell you where two branches diverged. This command will create a tag `_base` that will point to where they both diverged.

```sh
git tag _base `git merge-base develop master`
```

You can then use `git diff`, `git log`, or [tig] to inspect changes on either side:

```sh
# Inspect changes in Gemfile on each side
tig _base...develop -- Gemfile
tig _base...master -- Gemfile

git diff _base...develop -- Gemfile
git diff _base...master -- Gemfile
```

[git merge-base]: http://git-scm.com/docs/git-merge-base
[tig]: https://jonas.nitro.dk/tig
