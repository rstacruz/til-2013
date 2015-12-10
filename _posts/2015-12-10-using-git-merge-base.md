---
title: Use git merge-base for big merges
tags: [Development, Git]
description: Use this one command to help you with big Git merges.
---

When trying to merge two Git branches that have diverged a lot, it's a little difficult to make sense of what happened on both sides.

Enter [git merge-base]--a simple built-in utility to tell you where two branches diverged. It will tell you the commit where the two branches split off:

```nohighlight
$ git merge-base develop master
b8ac838cad3266f6a7e414181875831fd9b86ed5
```

### Set up git tags
This command will create a tag `_base` that will point to where they both diverged.

```sh
git tag _base `git merge-base develop master`
```
{:.terminal.large}

### Inspecting changes
You can then use `git diff`, `git log`, or [tig] to inspect changes on either side:

```sh
# Inspect changes in Gemfile on each side
tig _base...develop -- Gemfile
tig _base...master -- Gemfile

git diff _base...develop -- Gemfile
git diff _base...master -- Gemfile
```

### Check if both branches diverged
You can also use the `--independent` flag which will show commits that can't be reached by any other.  If it prints 2 commits, it means that there are changes on both sides.

```nohighlight
$ git merge-base develop master --independent
46978182cc8d90439b862e772e99a3f71889901a
8501118e0d958115caff692abda0f29ad530db4f
```

If it only prints 1, it means only one side has changes.

```sh
$ git merge-base develop master --independent
8501118e0d958115caff692abda0f29ad530db4f
```

[git merge-base]: http://git-scm.com/docs/git-merge-base
[tig]: https://jonas.nitro.dk/tig
