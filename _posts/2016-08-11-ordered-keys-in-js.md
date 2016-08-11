---
title: Ordered keys in JS objects
tags: [JavaScript]
description: So you think JavaScript has ordered keys? Think again.
---

It seems like JavaScript has ordered keys. Notice that the order of keys are based on insertion order.

```js
> obj = {};
> obj.zulu = 1;
> obj.yankee = 1;
> obj.xray = 1;
> obj
{ zulu: 1, yankee: 1, xray: 1 }
```

You can add more keys to an object, and it'll always end up in the end.

```js
> obj.bravo = 1;
> obj.alpha = 1;
> obj
{ zulu: 1, yankee: 1, xray: 1, bravo: 1, alpha: 1 }
```

## Not really

But there are special cases when the key is a string that is a number. Notice this puts the new key at the beginning:

```js
> obj['5'] = 1;
> obj
{ '5': 1, zulu: 1, yankee: 1, xray: 1, bravo: 1, alpha: 1 }
```

This is only true for numbers-as-strings. Strings that begin with numbers aren't affected.

```js
> obj['5X'] = 1;
> obj
{ '5': 1, zulu: 1, yankee: 1, xray: 1, bravo: 1, alpha: 1, '5X': 1 }
```

## Sorting behavior

The number-like keys are going to be sorted numerically (not lexically) before the other keys.

```js
> obj = {};
> obj.y = 1;
> obj.x = 1;
> obj['22'] = 1;
> obj['5'] = 1;
> obj['2'] = 1;
> obj
{ '2': 1, '5': 1, '22': 1, y: 1, x: 1 }
```

Hat tip to [@cheeaun](https://twitter.com/cheeaun/status/763578733496143872) for the observation on the behavior of numeric sorting!
