---
title: JavaScript shortcuts with Bitwise operators
description: Learn some shorter ways to write some common JavaScript expressions.
tags: [JavaScript]
---

### Rounding off a number
`Math.floor(3.5)` can be written as `3.5 | 0`. The [Bitwise OR](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_Operators#Bitwise_OR) operator will make an integer out of the number, and this construct is in fact used in [asm.js](http://asmjs.org/spec/latest/) to denote an integer.

```js
list[list.length * Math.random() | 0]
// ...same as list[Math.floor(list.length * Math.random()]
```
{:.terminal}

### Checking for -1
The [Bitwise NOT](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_Operators#Bitwise_NOT) operator will turn `-1` into zero. This makes indexOf checks less unweildy.

```js
if (~string.indexOf("John")) {
  // substring was found
}

// ...same as (string.indexOf("John") !== -1)
```
{:.terminal}
