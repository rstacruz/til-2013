---
title: Organizing JavaScript for simple sites
tags: [JavaScript]
---

Some sites don't need big JavaScript architectures, only a bit of little behaviors that will affect certain types of elements.

I prefer to put them into a directory called `behaviors/` where each file is a self-contained piece of code that only affects *one* element type. They should also be independent of each other, and therefore, order-agnostic.

### Examples

```js
// js/behaviors/selecttrap.js
// affects `.select2`
$(function () {
  $(".select2").select2();
})
```

```js
// js/behaviors/wow.js
// affects `.wow`
$(function () {
  new WOW().init();
})
```

```js
// js/tooltips.js
// affects `.tooltip`
$(document).on('hover', '.tooltip', function () {
  ...
});
```

### Including
Then just include them all. In Rails, this should be as easy as:

```js
//= require_tree ./behaviors
```

This JavaScript will be safe to include in all pages.
