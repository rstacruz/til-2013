---
title: Easy color computations
tags: [CSS]
description: Need to lighten/darken colors easily? Here's how.
---

```sh
$ npm i -g stylus
$ stylus -i
```
{:.terminal}

**Use [stylus]'s CLI.** Stylus CLI is faster than Sass and has shorter syntax for color computations. Here's *lighten* and *hue shift*:

```
> #aaa + 10%
=> #b2b2b2
```
```
> #ff0 - 10deg
=> #ffd500
```

### One-liner version
Not quite as elegant, but it can be useful.

```sh
echo "*{a: #ff0 - 10deg}" | stylus -p
* { a: #ffd500; }
```

### Using Sass
If you need Sass for some reason, it also takes `-i`.

``` sh
$ gem install sass
$ sass -i
>> darken(red, 10%)
#cc0000
```

[stylus]: http://learnboost.github.io/stylus
