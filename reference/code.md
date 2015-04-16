---
title: Code blocks
date: 1980-01-01
---

### Code block modifiers
Applies to code blocks (`pre`).

| Class | Description |
|:-----|-----:|
| `.terminal` | Terminal style |
| `.light` | Simpler light style |
| `.large` | Large font |
| `.cursor` | Has a cursor at the end |
{:.no-head}

<br>

## Examples

```ruby
def method_missing(name, args, &blk)
  yield name
end
```

```ruby
def method_missing(name, args, &blk)
  yield name
end
```
{:.light}

### Large terminal
Using `.large` and `.terminal` together

```
gem install rails
```
{:.terminal.large}

