---
title: Use Markdown for documentation
tags: [Development]
description: Forget complex documentation schemes... it's really just this easy.
---

The most universal documentation "format" is a bunch of Markdown files inside a project's `doc/` directory. Here are some projects that follow that convention:

* [io.js](https://github.com/iojs/io.js/tree/v1.x/doc/api) (and Node.js)
* [stylus](https://github.com/LearnBoost/stylus/tree/master/docs)
* [puppet](https://github.com/puppetlabs/puppet/tree/master/docs)
* [salt](https://github.com/saltstack/salt/tree/develop/doc) (uses .rst)
* [pip](https://github.com/pypa/pip/tree/develop/docs) (uses .rst)
* [npm](https://github.com/npm/npm/tree/master/doc)
* [composer](https://github.com/composer/composer/tree/master/doc)

In my opinion, "a bunch of Markdown files" is good because:

* It's easily viewable in GitHub
* It can be made into a Jekyll (GitHub pages) site easily
* It can be made into a Sphinx site easily
* It's a common documentation format that you can get some tools to generate to
