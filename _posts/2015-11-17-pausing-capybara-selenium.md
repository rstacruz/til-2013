---
title: Pausing Capybara tests
tags: [Ruby]
description: Use the web inspector in Capybara/Selenium tests.
---

Want to use the Web Inspector in Capybara/Selenium tests? The first thing you'll probably try is to use [pry-byebug](https://rubygems.org/gems/pry-byebug) to pause your tests. You'll probably find that this doesn't work.

```rb
it 'my test' do
  visit root_path
  binding.pry # ←
end
```

A better alternative is to use `$stdin.gets`. This is what [poltergeist](https://rubygems.org/gems/poltergeist) uses to pause execution. That method is not available in Capybara/Selenium though, so you'll need to add it in yourself:

```rb
$stderr.write 'Press enter to continue'
$stdin.gets
```

## With rspec
If you're using Capybara with Rspec, you can turn this into a helper. You can then just use `pause` in your tests.

```rb
# spec/support/pause_helpers.rb
module PauseHelpers
  def pause
    $stderr.write 'Press enter to continue'
    $stdin.gets
  end
end
```

```rb
# spec/rails_helper.rb
RSpec.configure do
  config.include PauseHelpers, type: :feature
end
```

## Using Poltergeist

When using Poltergeist, just use its [Remote Debugging](https://github.com/teampoltergeist/poltergeist#remote-debugging-experimental) feature with the `inspector: true` flag.
