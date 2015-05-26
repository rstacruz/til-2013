---
title: Markdown in Jekyll
description: Insert Markdown into any Jekyll document with this simple tag.
tags: [Development, Jekyll]
---
{% raw %}

To add Markdown to any HTML file in Jekyll, capture it into a variable and print that variable using *markdownify*. That is:

```
{% capture x %}
## This is markdown

so and so
{% endcapture %}{{ x | markdownify }}
```

Also, it's preferred to use [kramdown] as your Markdown processor: it supports GitHub-like code fencing and many useful Markdown extensions.

```yaml
# _config.yml
markdown: kramdown
kramdown:
  input: GFM
```

[kramdown]: http://kramdown.gettalong.org/

{% endraw %}
