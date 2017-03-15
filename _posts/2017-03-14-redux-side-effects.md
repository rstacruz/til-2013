---
title: Managing side effects in Redux
tags: [JavaScript]
description: Learn to manage impure side effects in a Redux store with middleware.
---

[Redux] is the preferred state management pattern for React apps today. Being a very "functional" library, it doesn't like side effects much. This means doing asynchronous actions in a Redux reducer is not just a bad idea, it simply won't work.

```js
/* ✗ Warning: This won't work! */

function reducer (state, action) {
  switch (action.type) {
    case 'profile:load':
      fetch('/my_profile')
        .then(res => res.json())
        .then(res => {
          dispatch({ type: 'profile:set', payload: res.body })
          // ✗ Error: dispatch is not defined
        })

        ...
```

You can't modify state here in an async callback. In fact, you can't even `dispatch()` in a reducer! This won't work and is a bad idea; you break the purity of the store reducer.

## Middleware for side effects

Fortunately, Redux has built-in provisions for managing side effects: [Middleware](http://redux.js.org/docs/advanced/Middleware.html)! You can write your own middleware with business logic. You don't need to use 3rd-party packages other than Redux itself.

Redux middleware is simply a decorator for `dispatch()`. Here's an example where we extend `dispatch()` to perform certain side effects (an AJAX call, in this case) when certain actions come in.

```js
// Redux middleware
function ProfileLoader () {
  return store => dispatch => action {
    dispatch(action) // First pass them through to the reducers.

    switch (action.type) {
      case 'profile:load!':
        fetch('/my_profile')
          .then(res => res.json())
          .then(res => dispatch({ type: 'profile:set', payload: res.body }))
          .catch(err => dispatch({ type: 'profile:error', payload: err }))
    }
  }
}
```

```js
// Use the middleware in your store
store = createStore(reducers, {}, applyMiddleware(
  ProfileLoader()
)
```

## Other solutions

Perhaps the most well-known solution to this is [redux-thunk](https://www.npmjs.com/package/redux-thunk), which allows you to dispatch functions ("thunks").

```js
// Using a function as an action via redux-thunk
store.dispatch((dispatch) => {
  fetch('/my_profile')
    .then(res => res.json())
    .then(res => dispatch({ type: 'profile:set', payload: res.body }))
    .catch(err => dispatch({ type: 'profile:error', payload: err }))
})
```

I personally advise against this approach for a number of reasons:

- It moves logic to your action creators, which were supposed to be very simple pieces of code.
- It makes actions complicated, when they can just be simple JSON instructions (eg, `{ type: 'profile:load' }`).
- It can't interact with other side effects. For instance, you can't make a side effect to send `profile:error`s to an error tracking service. Middleware can do this.

## Naming convention

You may have noticed I named my action `profile:load!`. This is my preferred convention of choice, where action names are simply strings, and "side effect" actions are suffixed with an exclamation mark, just as it would in Ruby or Elixir.

## Other examples

How about a middleware that tracks errors as they come in?

```js
function ErrorTracker () {
  return store => dispatch => action {
    dispatch(action)

    switch (action.type) {
      case 'profile:error':
      case 'account:error':
      case 'other:error':
        Rollbar.track(action.payload)
    }
  }
}
```

Or a middleware that sends `tick` events every second? Great for timers or for RPG's.

```js
function Ticker (options) {
  let timer

  return store => dispatch => action {
    dispatch(action)

    switch (action.type) {
      case 'ticker:start!':
        timer = setInterval(() => {
          store.dispatch({ type: 'ticker:tick', now: new Date() })
        }, options.interval)
        break

      case 'ticker:stop!':
        if (timer) clearInterval(timer)
        timer = null
        break
    }
  }
}
```

And to put them all together:

```js
store = createStore(reducers, {}, applyMiddleware(
  ProfileLoader(),
  ErrorTracker(),
  Ticker({ interval: 1000 })
)
```

## See also

Check out [Redux on devguides.io](http://devguides.io/redux)! Devguides.io is my new pet project where I make pocket-sized explainers for web development concepts.

[Redux]: http://redux.js.org/
