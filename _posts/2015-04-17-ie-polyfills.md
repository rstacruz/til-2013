---
title: Legacy IE polyfills
tags: [CSS]
description: Speed along your legacy IE development with this all-purpose 8-line snippet.
---

Use this convenient snippet in almost any project. It will fill in some basic support for modern CSS features for legacy IE versions.
{:.brief-intro.center}

{:.wide.light}
```js
<!--[if lt IE 9]>
<script src='https://cdn.jsdelivr.net/nwmatcher/1.2.5/nwmatcher.min.js'></script>
<script src='https://cdn.jsdelivr.net/json2/0.2/json2.min.js'></script>
<script src='https://cdn.rawgit.com/gisu/selectivizr/1.0.3/selectivizr.js'></script>
<script src='https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js'></script>
<script src='https://cdn.jsdelivr.net/respond/1.4.2/respond.min.js'></script>
<script src='https://cdn.jsdelivr.net/es5.shim/4.4.1/es5-shim.min.js'></script>
<![endif]-->
```

<br>

## What's going on?

The world has largely moved on from IE6 to IE8, but this is the least you can do to make your sites at least don't appear broken on older browsers. This snippet packs these 6 libraries which can be dropped into any project:

 - **[html5shiv]** — for new HTML5 tags like `<article>` (IE6-8)
 - **[respond]** — for `@media` queries for responsive design (IE6-8)
 - **[selectivizr]** — for all modern CSS selectors (IE6-8)
 - **[json2]** — for JSON parsing (IE6-7)
 - **[nwmatcher]** — the selector engine for selectivizr
 - **[es5-shim]** — add ES5+ functions (IE6-8)

It's wrapped in an [IE conditional comment][concom], so only the poor souls with outdated IE's will bear the extra load.

### Selectivizr
While Selectivizr has been abandoned at 1.0.2, there are new changes that haven't been officially released yet (see [#67](https://github.com/keithclark/selectivizr/issues/67)) that fixes interoperability with Respond.js. [This article](http://selectivizr.com/tests/respond) has the technical details, but is outdated in a few ways: Respond.js already [has support](https://github.com/scottjehl/Respond/pull/43) for selectivizr in upstream, and the selectivizr changes described are already sitting unreleased in the [master branch](https://github.com/keithclark/selectivizr).

This snippet uses [rawgit.com](http://rawgit.com/) to fetch the unreleased 1.0.3 from the fork [gisu/selectivizr](https://github.com/gisu/selectivizr) to fix interoperability issues with respond.js.

### Legacy IE cheatsheet
I've put together a [Legacy IE cheatsheet](http://ricostacruz.com/cheatsheets/ie.html) to help you figure out what features you can use for older versions of IE.

[html5shiv]: https://code.google.com/p/html5shiv/
[json2]: https://github.com/douglascrockford/JSON-js
[respond]: https://github.com/scottjehl/Respond
[selectivizr]: http://selectivizr.com/
[concom]: http://www.quirksmode.org/css/condcom.html
[NWmatcher]: http://javascript.nwbox.com/NWMatcher/
[es5-shim]: https://github.com/es-shims/es5-shim
