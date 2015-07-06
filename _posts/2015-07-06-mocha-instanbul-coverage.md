---
title: Getting Mocha coverage reports using Istanbul
description: Here's how to get detailed coverage reports from Mocha via Istanbul.
image: images/mocha-istanbul.png
tags: [JavaScript]
---

![]({{ page.image }}){:style='max-width:600px;margin-bottom:-75px'}
{:.full-image.cropped.bottom-space-4}

This is all you really need to run coverage reports on [Mocha] tests via [Istanbul].

```
istanbul cover _mocha
```
{:.terminal.large}

### Opening reports
Your reports will be available under `coverage/`. By default, you'll get  JSON files and an HTML report.

```nohighlight
open coverage/lcov-report/*.html
```
{:.light}

----

### Locking istanbul
Preferrably, though, you'll want to add `istanbul` to your project so you can pin down the version you need and have it available on your CI.

[Mocha]: http://mochajs.org/
[Istanbul]: https://www.npmjs.com/package/istanbul

```nohighlight
npm install --save-dev istanbul
./node_modules/.bin/istanbul cover _mocha
```
{:.light}

### Adding to gitignore
There's no need to commit the coverage reports.

```nohighlight
echo "/coverage" >> .gitignore
```
{:.light}

### Making an npm task
To make things a bit easier, add a script to your `package.json` to run this. After that, just invoke `npm run coverage`.

```js
/* package.json */
{
  ...
  "scripts": {
    "coverage": "istanbul cover _mocha -- -R spec"
  }
}
```

### Travis integration
If you're using [Travis] to automate your tests, you can also set it up to show coverage reports on your builds. [Looks like this](https://travis-ci.org/rstacruz/ractive-ractive).

```yml
# .travis.yml
script: npm run coverage
```

[Travis]: https://travis-ci.org/

