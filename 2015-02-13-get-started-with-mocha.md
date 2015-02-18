---
title: Get started with Mocha testing
tags: [JavaScript]
---

Here's the condensed 1-minute guide to setting up tests on a Node.js project.

Make a `package.json` file if you don't have one yet:

```sh
npm init
# just keep pressing enter.
# this will create the file `package.json`
```

Install your weapons:

```sh
npm install --save-dev mocha chai
```

## Write tests

Make your first test file `test/my_test.js`:

```js
/* test/my_test.js */
var expect = require('chai').expect;

describe('my test suite', function () {
  it('fails majestically', function () {
    expect(3).to.eql(2);
  });
});
```

Update your `package.json` to use mocha:

```diff
  "scripts": {
-   "test": "echo \"Error: no test specified\" && exit 1"
+   "test": "mocha"
  },
```

## Run tests

Run tests by typing `npm test`:

```
  my test suite
    1) fails majestically


  0 passing (17ms)
  1 failing

  1) my test suite fails majestically:

      AssertionError: expected 3 to deeply equal 2
      + expected - actual

      +2
      -3

      test/test.js:5:18: Context.<anonymous>
```

Now go write tests that will pass!

## Learn a bit more mocha

```js
describe('test suite', function () {
  beforeEach(function() { /*...*/ });
  afterEach(function() { /*...*/ });

  before(function() { /*...*/ });
  after(function() { /*...*/ });

  it('a basic test', function() {
    /*...*/ });

  it('a test with a promise', function() {
    return somePromiseObject; });

  it('an asynchronous test', function(next) {
    if (success) { next(); } else { next(error); }
  });

  xit('use "xit" for pending tests', function() {
    /*...*/ });
});
```

Also see http://mochajs.org/ - read up on Mocha's API

## More on Chai

```js
expect(3).to.eql(2);

expect(obj).to.be.a('string');
expect(obj).to.be.null;
expect(obj).to.be.true;
expect(obj).to.be.false;
expect(obj).to.be.undefined;

expect(list).to.include("item");
expect(list).to.have.length(3);
expect(list).to.have.length.gt(0);
```

See: http://chaijs.com/api/bdd/ â€” other `expect()`ations

## Further reading

- http://sinonjs.org/ - use Sinon for mocks

[Mocha]: http://mochajs.org/
[Sinon]: http://sinonjs.org/
