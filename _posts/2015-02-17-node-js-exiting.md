---
title: Node.js exit hooks
tags: [JavaScript]
description: Catch a Node program from exiting with these events.
---

Usually useful for test frameworks or daemon runners or whatever:

```js
process.on('uncaughtException', err => { ... })
process.on('SIGHUP', ...)
process.on('exit', ...)
process.on('beforeExit', ...)
```
