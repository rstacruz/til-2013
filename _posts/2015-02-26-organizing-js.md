---
title: Organizing JavaScript for simple sites
tags: [JavaScript]
description: How do you sort JavaScript files in a Rails project? Here's one way.
---

Some sites don't need big JavaScript architectures, only bits of small behaviors that will affect certain elements. Place them into a directory called `behaviors`.

* Each file is a self-contained piece of code that only affects a *single* element type.
* Name each one of the files according to the `class` (or `role`) it affects.
* They should also be independent of each other, and therefore, order-agnostic.

## Components

### Think in components

Think that a piece of JavaScript code to will only affect 1 "component", that is, a section in the DOM.

```html
<div class='main-navbar' role='collapsible-nav'>
</div>
```

```js
// affects the "collapsible-nav" JS component

$('html, body').on('scroll', function () {
  var $nav = $("[role~='collapsible-nav']");
  var y = $(window).scrollTop();
  var isScrolled = y > $nav.height;

  $nav.toggleClass('-hidden', !isScrolled);
});
```

----

### One component per file

Each file is a self-contained piece of code that only affects a *single* element type.

```js
// js/behaviors/collapsible-rows.js
$(document).on('hover', '[role~="collapsible-rows"]', function () {
  // ...
});
```

----

### Load components in all pages

In Rails, you can load safely load all behaviors for all pages. Since your files's behaviors are localized to a certain "component", they will not have any effect unless the component it services is present the page.

```js
// js/application.js
/*= require_tree ./behaviors
```

----

### Prefer to use event delegation

Instead of using `document.ready` to bind your events, consider using [jQuery event delegation][del] instead. This allows you to bind behaviors to, say, modal windows, where the element may not be present when the document loads.

There are cases wherein document.ready is necessary. If there's no other way to implement it, this should be fine.

[del]: http://learn.jquery.com/events/event-delegation/

```js
/* bad */
$(function () {
  $('[role~="collapsible-rows"]').on('hover', function () {
  });
});
```

```js
/* better */
$(document).on('hover', '[role~="collapsible-rows"]', function () {
});
```

----

### Use the role attribute

*Optional:* It's prefered to mark your component with a `role` attribute. You can use ID's and classes, but this can lead to confusion because your class name now means 2 things, and it makes it difficult to re-style if need be.

```html
<!-- bad -->
<div class='user-info'>...</div>
$('.user-info').on('hover', function() { ... });
```

```html
<!-- ok -->
<div class='user-info' role='avatar-popup'>...</div>
$('[role~="avatar-popup"]').on('hover', function() { ... });
```

----

### Don't overload classes

If you don't like the `role` attribute and prefer classes, don't add styles to the classes that your JS uses. For instance, if you're styling a `.user-info` class, don't attach an event to it; instead, add another class name (eg, `.js-user-info`) to use in your JS.

This will avoid a lot of confusion, 
This will make it easier to restyle components as needed.

```html
<!-- bad:
  is the JavaScript behavior attached to .user-info? or to .centered?
  This can be confusing for new developers.
-->
<div class='user-info centered '>...</div>
$('.user-info').on('hover', function() { ... });
```

```html
<!-- better:
  this makes it more apparent.
-->
<div class='user-info js-avatar-popup'>...</div>
$('.js-avatar-popup').on('hover', function() { ... });
```

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
