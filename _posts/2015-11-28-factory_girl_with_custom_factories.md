---
title: Using factory_girl with custom factories
tags: [Ruby]
description: Do you use an actual factory pattern in Rails? Set up factory_girl to use this factory.
---

[Factory Girl](https://github.com/thoughtbot/factory_girl) is great when creating 'presets' of ActiveRecord models. This is all you really need for most simple cases.

```rb
factory :user do
  name { 'John' }
  email { 'john@example.com' }
end
```

```rb
create :user
# same as User.create(name: 'John', email: 'john@example.com')
```
{:.light}

### Using custom factories

At some point however, your models may get too complicated and you may need an actual [factory](https://en.wikipedia.org/wiki/Factory_method_pattern)—a class that constructs an object and performs actions along with it.

```rb
class UserCreator
  attr_reader :user

  def self.create(attrs)
    @user = User.create(attrs)
    @user.profile = Profile.create(@user)
    @user.posts = create_sample_post
    # ...
    @user
  end
end
```

```rb
UserCreator.create(name: 'John')
```
{:.light}

### Setting it up

You can set up a `factory_girl` factory to use this by passing a `class` option. This delegates to your class's `.create` class method. You will need to create a Factory that implements a `create` method that returns an object.

```rb
factory :real_user, class: 'UserCreator' do
  ...
end
```

```rb
create :real_user
```
{:.light}

## Also see

Also see the [Factory Girl cheatsheet](http://ricostacruz.com/cheatsheets/factory_girl.html), along with other cheatsheets from my [cheatsheets](http://ricostacruz.com/cheatsheets) archive.
