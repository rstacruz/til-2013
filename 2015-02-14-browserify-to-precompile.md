---
title: Use Browserify to precompile npm libraries
---

Remove the hassle in writing npm libraries in a transpiled language ([6to5], [CoffeeScript], etc) by using browserify.

With this technique, there's no need to maintain a full new directory of source files... just one pre-built `dist/` file.

### Install the requisite packages

```sh
npm install --save-dev browserify coffeeify
```

### Make index.js
Make your main `index.js` like this for development:

```js
require('coffee-script/register');
require('./js2coffee.coffee');
```

### Set up compilation
Set up a compliation script in the prepublish hook:

```js
{
  "scripts": {
    "prepublish": "browserify -s js2coffee -x fs -t [ coffeeify -x coffee ] ./js2coffee.coffee > dist/js2coffee.js"
  }
}
```

* `-s` - standalone (uses a UMD wrapper)
* `-x` - don't stub these external modules
* `-t` - transform

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


[6to5]: http://6to5.org/
[CoffeeScript]: http://coffeescript.org/
[browserify]: https://github.com/substack/node-browserify
