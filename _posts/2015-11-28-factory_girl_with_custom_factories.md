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

UserCreator.create(name: 'John')
```

You can set up a `factory_girl` factory to use this by passing a `class` option. This delegates to your class's `.create` class method. You will need to create an actual Factory

```rb
factory :real_user, class: 'UserCreator' do
  ...
end

create :real_user
```

Also see the [Factory Girl cheatsheet](http://ricostacruz.com/cheatsheets/factory_girl.html)!
