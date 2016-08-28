---
title: Filtering falsy values
tags: [JavaScript]
description: Check out JavaScript's equivalent of Array.compact.
---

Quickly discard falsy values from an Array using `filter(Boolean)`. This is like [lodash.compact](http://devdocs.io/lodash~4/index#compact) or Ruby's [Array#compact](http://devdocs.io/ruby~2.3/array#method-i-compact).

```js
> ['this', 'has', undefined, false, 0, null, NaN, 'values'].filter(Boolean)
[ 'this', 'has', 'values' ]
```
