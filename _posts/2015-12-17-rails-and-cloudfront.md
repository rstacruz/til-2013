---
title: Using Cloudfront as a Rails CDN
tags: [Ruby]
description: This guide will walk you through using Amazon CloudFront as an asset CDN for your Rails app.
---

Setting up a CDN for your application assets is easy nowadays. This guide will walk you through using Amazon CloudFront as an asset CDN for your Rails application.

There are other guides out there today; [Heroku's CloudFront guide](https://devcenter.heroku.com/articles/using-amazon-cloudfront-cdn) is pretty good, but I think misses a few key points about CORS and denying requests outside `/assets`. This guide should fill those in.

## Set up CloudFront

Sign up in [aws.amazon.com](http://aws.amazon.com) and create a new CloudFront distribution. This will get you a subdomain (like `d1h2t3n5.cloudfront.net`) that will act as a caching proxy to your actual site. You may opt to use your own domain names if you like.

### Custom configuration
Make sure that `OPTIONS` is also being passed through. This will allow CORS requests through (see next section). Also, enable "compress automatically" to let CloudFront handle gzip compression for you.

* __Origin Settings__
    * Origin domain name: `www.yoursite.com`
* __Default Cache Behavior Settings__
    * Allowed HTTP Methods: `GET, HEAD, OPTIONS`
    * Cached HTTP Methods: Turn on `OPTIONS`
    * Compress Objects Automatically: `on`

## Set up asset host
{:.top-space-4}

This will make `image_tag`, `asset_url` and other asset-related helpers point your assets to your CloudFront distribution. Do this only for `production.rb`.

```rb
# config/environments/production.rb
config.action_controller.asset_host = '<YOUR DISTRIBUTION SUBDOMAIN>.cloudfront.net'
```

## Serve static assets
{:.top-space-4}

Enable the serving of static assets. You will want to do this if you're using Heroku or any 12-factor-style deployment.
If you use a reverse proxy like Nginx or Haproxy, skip this section and configure your reverse proxy to handle CORS instead.

```rb
# config/environments/production.rb
config.serve_static_assets = true
config.static_cache_control = 'public, max-age=31536000'
```

## Enable CORS in assets
{:.top-space-4}

If you use `serve_static_assets`, you will need to enable cross-origin requests for assets. This will prevent issues like Firefox not loading custom icons and fonts.

### Install the `rack-cors` gem
Use the [rack-cors] gem to enable cross-origin requests. At time of writing, it is at version 0.4.0.

[rack-cors]: https://rubygems.org/gems/rack-cors

```rb
# Gemfile
gem 'rack-cors'
```

### Configure rack-cors
This will make assets accessible from any website. You want to enable this because you'd want `yoursite.com` to be able to load assets out of `<id>.cloudfront.net`.

```rb
# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, 'Rack::Cors' do
  allow do
    origins '*'

    resource '/assets/*',
      headers: :any,
      methods: [:get]
  end
end
```

## Deny everything but /assets
{:.top-space-4}

Set up your app to disallow Cloudfront from fetching anything but `/assets`. This uses User Agent detection; see CloudFront's docs on [User-Agent headers](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/RequestAndResponseBehaviorCustomOrigin.html#request-custom-user-agent-header) for information.

If you miss this step, you'll be able to access the rest of your site in your CloudFront URL. While those aren't public, you'd best have them secured as it can open up security flaws and possibly lead to SEO penalties.

```rb
# config/routes.rb
Rails.application.routes.draw do
  match '*path', via: :all, to: 'errors#not_found',
    constraints: CloudfrontConstraint.new

  ...
```

```rb
# app/services/cloudfront_constraint.rb
class CloudfrontConstraint
  def matches?(request)
    request.env['HTTP_USER_AGENT'] == 'Amazon CloudFront'
  end
end
```

```rb
# app/controllers/errors_controller.rb
class ErrorsController
  def not_found
    raise ActiveRecord::RecordNotFound
  end
end
```
