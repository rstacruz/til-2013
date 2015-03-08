---
title: Use Bower packages like npm packages
tags: [JavaScript]
description: Ever wanted to use some frontend packages but they're not npm-compatible?
---

[Napa] is a package that lets you install arbitrary projects (without package.json) into `node_modules`.

Bower packages are repos without package.json manifests. Hence, you can use Napa to use Bower packages as if they were npm packages... sort of.

```js
{
  "scripts": {
    "install": "napa"
  },
  "napa": {
    "hint": "chinchang/hint.css#v1.3.1",
    "colorbox": "jackmoore/colorbox#1.5.9"
  }
```

Promising idea, but I'd like to see it developed more. Some caveats as of 1.2.0:

- not compatible with `npm shrinkwrap`
- upgrading packages are not automatic

[Napa]: https://www.npmjs.com/package/napa
