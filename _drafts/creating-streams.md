---
title: Creating streams
---

Line by line reader using through2 and split2

```js
var through2 = require('through2');
var split2 = require('split2');

fs.createReadStream(file)
  .pipe(split2())
  .pipe(parse())
  .pipe(through2(chunk, _, done) {
    console.log(chunk);
    done();
  });

function parse() {
  through2.obj(onLine, onEnd);

  function onLine(line, _, callback) {
    this.push(...);
    callback();
  }

  function onEnd(callback) {
    this.push(...);
    callback();
  }
}
```

