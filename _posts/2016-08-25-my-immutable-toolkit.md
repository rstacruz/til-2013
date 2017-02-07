---
title: Tools for immutable work
tags: [JavaScript]
description: Make writing immutable JavaScript easier with these tools.
---

Most people reach for [lodash] for general-purpose JavaScript work. With the recent tides shifting towards functional programming, [Ramda] has become a popular option as well. I don't prefer to use them, let me show you why.

## Accumulated bloat

I love both lodash and Ramda, but they're a bit too bloated to use for web apps. A simple [lodash.map](https://lodash.com/docs#map) weighs in at a whopping 24 kilobytes:

```bash
$ browserify -r lodash/map | uglifyjs -cm | wc -c
24895
```

{:.terminal}

Ramda's [R.map](http://ramdajs.com/0.21.0/docs/#map) is slimmer, but still hefty at 7kb:

```bash
$ browserify -r ramda/src/pluck | uglifyjs -cm | wc -c
7750
```

{:.terminal}

This may not seem like much, but for a web application, every kilobyte matters.

## Loops

While JavaScript comes with [Array.prototype.map](http://devdocs.io/javascript/global_objects/array/map), it's not very useful for objects. I don't appreciate that iterating through arrays are done differently from iterating through objects. Not only that, but iterating through `Object.keys().map` is one of the slower ways of looping through an object's keys.

```js
// Iterating through arrays
array.map((val, key) => {
  /*...*/
})

// Iterating through objects
Object.keys(object).map(key => {
  let val = object[key]
  /*...*/
})
```

For this, I prefer [object-loops](https://www.npmjs.com/package/object-loops). `object-loops/map` is only 1kb!

```js
import map from 'object-loops/map'
map(array, (val, key) => { /*...*/ })
map(object, (val, key) => { /*...*/ })
```

## Immutable Set/get

Setting deep keys is something that's needed in every [Redux]-powered app. While most Redux guides advice you to use the [spread operator](http://devguides.io/redux/introduction#the-spread-operator), it quickly gets unwieldy for deep structures.

```js
// Plain mutable JS
state.albums[id] = album

// ESnext syntax
state = {
  ...state,
  albums: {
    ...state.albums,
    [id]: album
  }
}
```

For this, [101](https://www.npmjs.com/package/101) comes with `101/put` and `101/pluck`.

```js
import set from '101/put'
import get from '101/pluck'

state = set(state, `albums.${id}`, album)
get(state, `albums.${id}`)
```

It comes with `101/omit` as well as an immutable analogue for `delete`.

```js
// Plain mutable JS
delete state.albums[id]

// Using 101
import del from '101/omit'
del(state, `albums.${id}`)
```

## Recap

[object-loops] is great for iteration.

```js
// Iterating
import map from 'object-loops/map'

map(state.albums, (val, key) => { /*...*/ })
```

[101] is great for setting/getting values from deep structures.

```js
// Setting and getting
import set from '101/put'
import get from '101/pluck'
import del from '101/omit'

state = set(state, `albums.${id}`, album)
state = del(state, `albums.${id}`)
get(state, `albums.${id}`)
```

[lodash]: http://lodash.com/
[Ramda]: http://ramdajs.com/
[Redux]: http://redux.js.org/
[object-loops]: https://www.npmjs.com/package/object-loops
[101]: https://www.npmjs.com/package/101
