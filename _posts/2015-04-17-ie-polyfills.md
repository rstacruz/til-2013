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
<script src='//cdnjs.cloudflare.com/ajax/libs/json2/20140204/json2.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/selectivizr/1.0.2/selectivizr-min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js'></script>
<![endif]--> 
```
{:.wide.light}

<br>

## What's going on?

It seems that every project will need the same set of polyfills to enable modern features in legacy Internet Explorer.

 - **[json2]** for JSON parsing (IE7 below)
 - **[selectivizr]** for selectors (IE8 below)
 - **[nwmatcher]** selector engine for selectivizr
 - **[html5shiv]** for new HTML tags (IE8 below)
 - **[respond]** for media queries (IE8 below)

### Legacy IE cheatsheet
I've put together a [Legacy IE cheatsheet](http://ricostacruz.com/cheatsheets/ie.html) to help you figure out what features you can use for older versions of IE.

[html5shiv]: https://code.google.com/p/html5shiv/
[json2]: https://github.com/douglascrockford/JSON-js
[respond]: https://github.com/scottjehl/Respond
[selectivizr]: http://selectivizr.com/
[concom]: http://www.quirksmode.org/css/condcom.html
[NWmatcher]: http://javascript.nwbox.com/NWMatcher/
