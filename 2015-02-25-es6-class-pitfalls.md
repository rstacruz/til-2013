---
title: ES6 class pitfalls
tags: [JavaScript]
---

ES6 makes it easy to define classes.

```js
class Shape {
  get area() {
    return this.width * this.height;
  }
}
```

But you can't have decorated functions. For that, you'll still need to drop to using `prototype`.

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
