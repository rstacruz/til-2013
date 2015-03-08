---
title: Inline partials
tags: [Ruby]
description: Organize long views into smaller sub-views with this tip.
---

Ever find it annoying to have really long blocks of code being hard to parse in your head?

```haml

- if @list.any?
  - @list.each do |item|
    - # really long code
    - # ...

- else
  - # also long code
  - # ...
```

You can break them into partials, or like so:

```ruby
- body, list, empty = nil

- body = Proc.new do
  - if @list.any?
    - list.call
  - else
    - empty.call

-# List of items
- list = Proc.new do
  %div
    - @venues.each do |venue|
      = venue

-# No items available
- empty = Proc.new do
  %div nothing here

- body.call
```
