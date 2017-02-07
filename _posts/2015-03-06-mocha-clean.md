---
title: Cleaner Mocha stack traces
tags: [JavaScript]
description: Suppress stack trace frames from 3rd-party modules in Mocha.js.
image: https://raw.githubusercontent.com/rstacruz/mocha-clean/gh-pages/comparison.png
---

[Mocha] is a great way to test JavaScript, but its stack traces are riddled
with useless frames from Mocha internals and 3rd-party modules. Let's try and
clean it up.
{:.brief-intro.center}

![Image]({{ page.image }})
{:.full-image.cropped}

<br>

### Introducing mocha-clean

`mocha-clean` is a plugin for Mocha. It strips away mocha internals,
node_modules, absolute paths (based on cwd), and other unneccessary cruft
from stack traces.
Simply invoke Mocha with `-r mocha-clean`. The easiest way to do this is to add
it to your *test/mocha.opts* file.

```
--require mocha-clean
```

It's available via npm, and works with Mocha 1.x in Node.js and in the browser. The source is available in GitHub: [rstacruz/mocha-clean][src].

```bash
npm install --save-dev mocha-clean
```
{:.terminal}

* * * *

### Merging into Mocha?

A pull request is currently open in Mocha to integrate this functionality into Mocha itself. Check out [#1564](https://github.com/mochajs/mocha/pull/1564) and offer your support and comments.

[src]: https://github.com/rstacruz/mocha-clean
[Mocha]: http://visionmedia.github.io/mocha

