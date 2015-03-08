---
title: ES6 class pitfalls
tags: [JavaScript]
description: Keep aware of this one caveat when making classes in ES6.
---

```js
class Shape {
  get area() {
    return this.width * this.height;
  }
}
```

ES6 makes it easy to define classes, but you can't have decorated functions. For that, you'll still need to drop to using `prototype`.

```js
Shape.prototype.iterate = memoize(function () {
  ...
})
```

Same with non-method attributes.

```js
Shape.prototype.template =
  require('fs').readFileSync('./template.html', 'utf-8');
```
