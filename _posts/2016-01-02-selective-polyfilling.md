---
title: Selective polyfilling
tags: [JavaScript]
description: Load JavaScript polyfills in a smart, controlled manner.
---

Need to support legacy browsers, but don't want the full weight of [es5-shim] loaded for everyone? Sure, just load it for browsers that need it!

[es5-shim]: https://github.com/es-shims/es5-shim

```js
<script>(function(){function a(src){var s=document.createElement('script'),r=document.getElementsByTagName('script')[0];s.src=src;s.type='text/javascript';r.parentNode.insertBefore(s,r)}
this.JSON||a('https://cdn.jsdelivr.net/json2/0.2/json2.min.js');
(Object.keys&&[].map&&alert.bind)||a('https://cdn.jsdelivr.net/es5.shim/4.4.1/es5-shim.min.js');
this.Promise||a('https://www.promisejs.org/polyfills/promise-6.1.0.js');
}())</script>
```
{:.light}

It should be easy enough to add more polyfills as you need them. You can also include some [legacy IE polyfills](ie-polyfills.html) to complete the experience.
