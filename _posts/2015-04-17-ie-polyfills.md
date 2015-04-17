---
title: Legacy IE polyfills
tags: [Development]
description: Speed along your legacy IE development with this all-purpose 7-line snippet.
---

Here's a convenient snippet you can use for almost any project. It's wrapped in an [IE conditional comment][concom], so only the poor souls with outdated IE's will bear the extra load.
{:.brief-intro.center}

```js
<!--[if lt IE 9]>
<script src='//cdnjs.cloudflare.com/ajax/libs/nwmatcher/1.2.5/nwmatcher.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/json2/20140204/json2.min.js'></script>
<script src='//cdn.rawgit.com/gisu/selectivizr/1.0.3/selectivizr.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js'></script>
<![endif]--> 
```
{:.wide.light}

<br>

## What's going on?

It seems that every project will need the same set of polyfills to enable modern features in legacy Internet Explorer.

 - **[respond]** enables `@media` queries for responsive design (IE8 below)
 - **[selectivizr]** enables all modern CSS selectors (IE8 below)
 - **[html5shiv]** enables new HTML5 tags like `<article>` (IE8 below)
 - **[json2]** enables JSON parsing (IE7 below)
 - **[nwmatcher]** is the selector engine for selectivizr

### Selectivizr
While Selectivizr has been abandoned at 1.0.2, there are new changes that haven't been officially released yet (see [#67](https://github.com/keithclark/selectivizr/issues/67)). This snippet uses rawgit.com to fetch the unreleased 1.0.3 from the fork [gisu/selectivizr](https://github.com/gisu/selectivizr), which fixes interoperability issues with respond.js.

### Legacy IE cheatsheet
I've put together a [Legacy IE cheatsheet](http://ricostacruz.com/cheatsheets/ie.html) to help you figure out what features you can use for older versions of IE.

[html5shiv]: https://code.google.com/p/html5shiv/
[json2]: https://github.com/douglascrockford/JSON-js
[respond]: https://github.com/scottjehl/Respond
[selectivizr]: http://selectivizr.com/
[concom]: http://www.quirksmode.org/css/condcom.html
[NWmatcher]: http://javascript.nwbox.com/NWMatcher/
