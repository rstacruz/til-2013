---
title: Using npm packages in Rails
tags: [Ruby]
description: Load CSS/JavaScript packages from npm.
---

We load our gems from [Rubygems][], but a lot of you may still be placing your JavaScripts into `vendor/assets/javascripts`. Why not use [npm][]? It's actually pretty easy to set up Rails to use npm.

[Rubygems]: https://rubygems.org/
[npm]: https://www.npmjs.com/

## Use npm itself

The best way to load npm packages in Rails is to use npm as your pipeline itself. [npm-pipeline-rails](https://github.com/rstacruz/npm-pipeline-rails) helps you do just that.

Don't want to switch away from the asset pipeline? That's fine, read on for an alternative approach.

## Alternative

### Add `node_modules` to your gitignore
Because you don't want to commit those, just like you don't commit your gems.

```bash
echo '/node_modules' >> .gitignore
```

### Create a `package.json` in your project
This is the npm equivalent of a `Gemfile`—it's where your packages are stored.

```
npm init
```

### Add `node_modules` to your asset path
This lets you use npm modules in your Sprockets assets. In `config/application.rb`:

```rb
module YourApp
  class Application < Rails::Application
    config.assets.paths << Rails.root.join('node_modules')
```

### Run `npm install` on startup
Rails (or Bundler) prevents you from starting itself when you have gems that aren't installed yet. To emulate that behavior for npm packages, do this in `config/initializers/npm.rb`:

```rb
system 'npm install' if Rails.env.development? || Rails.env.test?
```

### Heroku: add Node.js support
If you're deploying to Heroku, the default Ruby buildpack doesn't include Node, which you need to use npm. Add both the Node.js and Ruby buildpacks:

```bash
heroku bulidpacks:add 'https://github.com/heroku/heroku-buildpack-nodejs.git'
heroku bulidpacks:add 'https://github.com/heroku/heroku-buildpack-ruby.git'
```

## Adding JavaScript packages

You can only use node modules that come with a pre-built version in it. [modernizr] won't work. You can try [browserify-rails][].

[browserify-rails]: https://github.com/browserify-rails/browserify-rails

### Use `npm install`

```bash
npm install --save --save-exact modernizr
```

### Add to `application.js`
Then in your `application.js`, require it like so:

```js
//= require onmount/onmount
```

[modernizr]: https://modernizr.com/
