---
title: Using Bower and Rails in Heroku
tags: [Ruby]
---

This seems pretty easy until you realize that Bower (a Node.js package) is not available in the Heroku Ruby build pack.

### bower-rails
The gem [bower-rails](http://rubygems.org/gems/bower-rails) allows for easy Bower integration into Rails, but it won't work out of the box in Heroku.

### Adding execjs
The [Ruby buildpack](https://github.com/heroku/heroku-buildpack-ruby) has a magic behavior where if it detects the `execjs` gem, it will [bundle Node.js](https://github.com/heroku/heroku-buildpack-ruby#assets) with the build. This should make it work.

    gem 'execjs'

### Alternative: use multiple build packs
Use the [Multi buildpack](https://github.com/ddollar/heroku-buildpack-multi) like so:

    heroku config:add BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git

To use both Ruby and Node.js buildpacks:

    # vim .buildpacks
    https://github.com/heroku/heroku-buildpack-nodejs.git#v60
    https://github.com/heroku/heroku-buildpack-ruby.git#v127

I recommend locking the versions (`#v60`) to ensure that you get versions that interoperate together (in case one upgrades and breaks interoperability).

The last pack defined (Ruby in this case) is the "main" one that defines the process types (web, console, etc).
