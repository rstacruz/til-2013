---
title: Babel class inheritance in Internet Explorer
tags: [JavaScript]
description: IE doesn't support class inheritance in Babel. Here's a way to fix that.
---

```js
class Circle extends Shape {
  getArea() {
    return this.radius * Math.PI * 2;
  }
}
```

### Class inheritance caveats
When using class inheritance with Babel.js, keep in mind that IE10 and below are [not supported](http://babeljs.io/docs/advanced/caveats) by default. Babel's class inheritance relies on *\_\_proto\_\_* which is not available on legacy IE versions.

Using *super* is also not supported on IE8 and below, as it compiles down to using [Object.getPrototypeOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getPrototypeOf).

To get around these caveats, use the [protoToAssign](http://babeljs.io/docs/advanced/transformers/spec/proto-to-assign/) transformer to make inheritance work, along with loose mode on classes to enable support for `super`.

```sh
babel --optional spec.protoToAssign --loose es6.classes script.js
```
{:.terminal}
