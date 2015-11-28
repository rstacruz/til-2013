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

  def initialize(attrs)
    @user = User.create(attrs)
    @user.profile = Profile.create(@user)
    @user.posts = create_sample_post
  end
end
```

```rb
creator = UserCreator.create(name: 'John')
creator.user
```
{:.light}

### Setting it up (the hard way)

Factory Girl will then consume a class in this manner:

```
user = User.new
user.name = 'John'
user.save!
```

You can set up a `factory_girl` factory to use this by passing a `class` option.  You'll have to make your factory implement these methods. This is silly and painful.

```rb
factory :real_user, class: 'UserCreator' do
  ...
end
```

```rb
create(:real_user).user
```
{:.light}

## Even easier

Why not use the [attributes_for](http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md#Using_factories) helper instead?

```rb
UserCreator.create attributes_for(:user)
```

## Also see

Also see the [Factory Girl cheatsheet](http://ricostacruz.com/cheatsheets/factory_girl.html), along with other cheatsheets from my [cheatsheets](http://ricostacruz.com/cheatsheets) archive.
