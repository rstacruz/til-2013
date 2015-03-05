---
title: Easy color calculations
tags: [CSS]
---

Use [stylus]'s CLI.

```sh
$ npm i -g stylus
$ stylus -i
```

Stylus boost faster that Sass and has shorter syntax for color computations. Here's lighten:

```
> #aaa + 10%
=> #b2b2b2
```

Hue shift:

```
> #ff0 - 10deg
=> #ffd500
```

Or if you really want a one-liner:

```sh
echo "*{a: #ff0 - 10deg}" | stylus -p
* { a: #ffd500; }
```

[stylus]: http://learnboost.github.io/stylus
