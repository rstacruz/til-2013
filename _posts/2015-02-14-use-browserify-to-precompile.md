---
title: Use Browserify to precompile npm libraries
tags: [JavaScript]
description: Keep large libraries sane using Browserify. With ES6 and CoffeeScript support!
---

Remove the hassle in writing npm libraries in a transpiled language ([babeljs], [CoffeeScript], etc) by using browserify.

With this technique, there's no need to maintain a full new directory of compiled files... just one pre-built `dist/` file.

### Files

```
.
├─ lib
│  └─ index.js        - actual entry point
├─ dist
│  └─ js2coffee.js    - built package
└─ index.js           - entry point (used in development)
```

### Install the requisite packages

```sh
npm install --save-dev browserify babelify
```

### Make the entry point
Put your *actual* main entry point as, say, `./lib/index.js`. Then create an entry point `./index.js` like this for development:

```js
require('babel/register');
module.exports = require('./lib/index');
```

### Set up compilation
Set up a compliation script in the prepublish hook:

```js
{
  "scripts": {
    "prepublish": "browserify -s js2coffee --bare -t [ babelify ] ./lib/index.js > dist/js2coffee.js"
  }
}
```

For CoffeeScript support, use [coffeeify](https://github.com/jnordberg/coffeeify) for CoffeeScript (`-t [ coffeeify -x .coffee ]`).

Options used:

* `-s` - standalone (uses a UMD wrapper)
* `--bare` - don't stub node builtins
* `-t` - define transformations to use
* `--no-bundle-external` - don't bundle required node modules. use this only for node.js apps, not browser apps.

### Point the package
Set `main` in `package.json` to the precompiled version:

```js
{
  "main": "dist/js2coffee.js"
}
```

### All done

* Every time `npm publish` is called, the pre-built version (dist/js2coffee.js) gets built
* Doing `require('js2coffee')` will point to the `dist/` version
* Doing `require('../index')` in your tests will point to the source version
* You can also do `require('js2coffee/index')` from other packages

### Babel

For [babeljs], I recommend using `--loose` for libraries that will target legacy IE.

```
-t [ babelify --loose all ]
```

[babeljs]: http://babeljs.io/
[CoffeeScript]: http://coffeescript.org/
[browserify]: https://github.com/substack/node-browserify
