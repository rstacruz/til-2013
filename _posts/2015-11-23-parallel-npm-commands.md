---
title: Running NPM tasks in parallel
tags: [Development]
description: You can run multiple NPM script tasks in parallel. This is great for tasks like running build watchers.
---

You can run multiple NPM script tasks in parallel. This is great for tasks like running build watchers. Just use the bash construct `&` to put each command in the background, then finally add `wait` so they can be terminated with `^C`. The final syntax would be:

```sh
command1 & command2 & wait
```

In pratice, this looks like so:

```js
{
  "scripts": {
    "watch": "npm run watch:js & npm run watch:css & wait",
    "watch:js": "watchify -v -t babelify -s Editor index.js -o dist/index.js",
    "watch:css": "stylus -w css/style.styl -o dist/index.css",
  }
}
```
