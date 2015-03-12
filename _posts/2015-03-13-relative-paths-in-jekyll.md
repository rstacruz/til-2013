---
title: Relative paths in Jekyll
tags: [Development, Jekyll]
description: Fix the problem with GitHub Pages's relative URLs with this snippet.
---
{%raw%}

[Jekyll] is a great static site tool. If you're using [GitHub Pages][gh-pages], it comes with it for free, making it a very useful tool for any public blog or website. It comes, though, with one common problem that I've yet to come across a good solution for: relative paths.
{:.brief-intro.center}

## The problem

```html
<!-- _layouts/default.html -->
<link href='assets/style.css' rel='stylesheet'>
```
{:.terminal}

### The mess of relative paths
Let's say you have an innocent URL in your layout like the one above. This is a relative path, not an absolute one that begins with `/`. It resolves based on wherever it's included from.

This works well in pages of your site placed in the root directory. Once you path one level deep though, you'll encounter problems.

| From this page... | Base | Final URL |  |
|----|----|----|----:|
| `/index.html` | `/` | `/assets/style.css` | Good ✓ |
| `/me.html` | `/` | `/assets/style.css` | Good ✓ |
| `/about/profile.html` | `/about` | `/about/assets/style.css` | Wrong ✗ |
{:.lite-headings}

<br>

## A naive workaround

One workaround is to use absolute paths by adding a `/` in the beginning.

```html
<link href='/assets/style.css' rel='stylesheet'>
            ^
```

### Why absolute URLs suck
This works great for sites that live on its own domain. When your site will be hosted in a sub-directory (such as the case with [GitHub Project Pages][gh-pages]), this absolute path will not resolve to `/project/assets/style.css` as you probably would have intended.


| If your site is in... | It resolves to... | | 
|----|----|----:|
| `user.github.io/` | `/assets/style.css` | Good ✓ |
| `user.github.io/project/` | `/assets/style.css` | Wrong ✗ |
{:.lite-headings}

<br>

## A better workaround

This snippet below automatically determines the relative base and stores it in the variable `base`. Place it in your partials path, and include the partial in your layouts.

```html
<!-- _includes/base.html -->
{% assign base = '' %}
{% assign depth = page.url | split: '/' | size | minus: 1 %}
{% if    depth == 1 %}{% assign base = '.' %}
{% elsif depth == 2 %}{% assign base = '..' %}
{% elsif depth == 3 %}{% assign base = '../..' %}
{% elsif depth == 4 %}{% assign base = '../../..' %}{% endif %}
```

### Use it as a prefix
You can then use it as a prefix to URLs, like the examples below. You don't need to `include` it all the time—just include it once in your layouts and it will be available everywhere.

```html
{% include base.html %}
<link href='{{base}}/assets/style.css' rel='stylesheet'>
```

```html
<a href='{{ base }}'>Back to home</a>
```

```html
<a href='{{ base }}/about.html'>About me</a>
```

```html
<a href='{{ base }}{{ post.url }}'>Read "{{ post.title }}"</a>
```

[Jekyll]: http://jekyllrb.com/
[gh-pages]: http://pages.github.com/
{%endraw%}
