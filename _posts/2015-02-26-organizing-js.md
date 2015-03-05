---
title: Organizing JavaScript for simple sites
tags: [JavaScript]
---

Some sites don't need big JavaScript architectures, only bits of small behaviors that will affect certain elements.

I prefer to put them into a directory called `behaviors/` where each file is a self-contained piece of code that only affects *one* element type. They should also be independent of each other, and therefore, order-agnostic.

### Example project
Name each one of the files according to the `class` (or `role`) it affects.

```js
...
└── javascripts/
    └── behaviors/
        ├── colorpicker.js
        ├── modal.js
        ├── select2.js
        ├── tooltip.js
        └── wow.js
```

### File examples

```js
// select2.js -- affects `.select2`
$(function () {
  $(".select2").select2();
})
```

```js
// wow.js -- affects `.wow`
$(function () {
  new WOW().init();
})
```

```js
// tooltips.js -- affects `.tooltip`
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
