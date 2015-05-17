---
title: Organizing JavaScript for simple sites
tags: [JavaScript]
description: How do you sort JavaScript files in a Rails project? Here's one way.
---

Some sites don't need big JavaScript architectures, only bits of small behaviors that will affect certain elements. I prefer to put them into a directory called `behaviors`.

* Each file is a self-contained piece of code that only affects a *single* element type.
* Name each one of the files according to the `class` (or `role`) it affects.
* They should also be independent of each other, and therefore, order-agnostic.

## Example project

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

### Using behaviors
Just include them all into one file. In Rails, this should be as easy as:

```js
//= require_tree ./behaviors
```

This JavaScript will be safe to include in all pages.
