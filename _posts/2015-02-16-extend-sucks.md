---
title: "@extend sucks"
tags: [CSS]
description: Let me tell you why you should never use @extend again.
---

Using `@extend` in CSS preprocessors really suck... so use mixins instead. Consider this example:

```scss
%antialias {
  text-rendering: optimizeLegibility !important;
  -webkit-font-smoothing: antialiased !important;
  -moz-osx-font-smoothing: grayscale;
}
```

Seems innocent enough:

```scss
h3 {
  @extend %antialias;
}
```

Until you try it with media queries:

```scss
@media (max-width: 300px) {
  h3 {
    @extend %antialias;
  }
}
```

...then it won't work. Use mixins instead.
