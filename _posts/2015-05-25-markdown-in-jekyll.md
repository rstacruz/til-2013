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

## Kramdown
Also, it's preferred to use [kramdown] as your Markdown processor: it supports GitHub-like code fencing and many useful Markdown extensions.

```yaml
# _config.yml
markdown: kramdown
kramdown:
  input: GFM
```

If you do, there's a great alternative. Name your HTML files as `.md`, which is fine, because Markdown will ignore HTML blocks by default. You can then opt into Markdown processing via `markdown="1"`. More info on this on Kramdown's [documentation]. Hat tip to [@marksteve].

```html
<div>
  <h3>I'm HTML</h3>
  <div markdown="1">
I am *Markdown text*. Be sure not to indent me, else
I'll be interpreted as a code block.
  </div>
</div>

```

[kramdown]: http://kramdown.gettalong.org/
[@marksteve]: http://marksteve.com
[documentation]: http://kramdown.gettalong.org/syntax.html#html-blocks
{% endraw %}
