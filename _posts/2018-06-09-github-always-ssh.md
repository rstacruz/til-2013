---
title: Force git to use SSH on GitHub
description: |
  Make Git always use SSH: `git config --global url."git@github.com:".insteadOf "https://github.com/"`
tags: [Development]
---

### Always SSH (recommended)

This forces GitHub to always use SSH, even for HTTPS URL's!

```bash
git config --global url."git@github.com:".insteadOf "https://github.com/"
```

This way, you can use `https://` GitHub URL's and they will still use your SSH key.

```bash
git clone https://github.com/rstacruz/vimfiles.git
# rewrites to `git@github.com:rstacruz/vimfiles.git`
```

### Always HTTPS

Alternatively, this forces GitHub to always use HTTPS. Great for OSX, where you can use [git-credential-osxkeychain](https://help.github.com/articles/updating-credentials-from-the-osx-keychain/) to store your GitHub token.

This will _not_ rewrite `git@github.com:user/repo.git` URL's, though, so I don't really recommend it! Besides, SSH keys are often easier to manage than API tokens.

```bash
git config --global url."https://github".insteadOf git://github
```

### References

Hat tip to these people!

- <https://gist.github.com/Kovrinic/ea5e7123ab5c97d451804ea222ecd78a>
- <https://gist.github.com/grawity/4392747>
