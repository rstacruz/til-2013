---
title: JavaScript shortcuts using bitwise operators
description: Learn some shorter ways to write some common JavaScript expressions.
tags: [JavaScript]
---

Some common operations can be made shorter using bitwise operators. Here are some of my favorites.
{:.brief-intro}

### Rounding off a number

`Math.floor(3.5)` can be written as `3.5|0`. The [Bitwise OR](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_Operators#Bitwise_OR) operator will make an integer out of the number, and this construct is in fact used in [asm.js](http://asmjs.org/spec/latest/) to denote an integer.

```js
list[list.length * Math.random() | 0]
// ...same as:
list[Math.floor(list.length * Math.random()]
```

### Checking for -1
The [Bitwise NOT](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_Operators#Bitwise_NOT) operator will turn `-1` into zero. This makes substring checks with `indexOf()` a little shorter.

```js
if (~string.indexOf("John")) { ... }
// ...same as:
if (string.indexOf("John") !== -1) { ... }
```
