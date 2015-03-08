---
title: Refactoring long calls
tags: [Development]
description: Clean up long code reasonably with these tips.
---

Consider seeing this code in a view. It seems a little long, and may be a candidate for refactoring.
{:.brief-intro.center}

```ruby
= event.ticket.custom_message.to_s.strip.gsub("[URL]", site_url)
```
{:.terminal.medium}

----

### Attempt #1
One way to rewrite this is to make it as short as possible, ie, store all the complexity in a helper function.

```ruby
= custom_message_for(event)
```

```ruby
def custom_message_for(event)
  event.ticket.custom_message.to_s.strip.gsub("[URL]", site_url)
end
```

In my opinion, this isn't really good because:

 * The complexity was simply moved from one part to another, instead of broken down into more easily-understandable chunks.
 * The method `custom_message_for` is too tightly coupled. To test this, you will need to create a mock event, with a mock ticket, with a mock custom message.

----

### Attempt #2
I would prefer this to be written as:

```ruby
= format_message(event.ticket.custom_message)
```

```ruby
def format_message(message)
  message.to_s.strip.gsub("[URL]", site_url)
end
```

The view code may be a little longer, but you get these advantages:

 * The method `format_message` is simple and its purpose is immediately obvious.
 * Glancing at the view code (`format_message(event...)`), it's apparent how the message is being derived.
 * It can be easily tested (just need to pass it a string).

...Another way to implement this is with a presenter, which may not be a bad idea either.
