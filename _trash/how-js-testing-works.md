We've seen test assertions like so:

```js
it('should fail', function () {
  expect("hello").to.eql("world");
});
```

### What expect() is
It's merely something that throws an exception.

```js
try {
  var expect = require('chai').expect;
  expect("hello").to.eql("world");
} catch (e) {
  console.log(e);
}
```

You can expect the built-in [assert](https://iojs.org/api/assert.html) module of Node.js and io.js to work the same:

```js
try {
  var assert = require('assert');
  assert.equal("hello", "world");
} catch (e) {
  console.log(e);
}
```

```
// result:
{ [AssertionError: 'hello' == 'world']
  name: 'AssertionError',
  actual: 'hello',
  expected: 'world',
  operator: '==',
  message: '\'hello\' == \'world\'',
  generatedMessage: true }
```
