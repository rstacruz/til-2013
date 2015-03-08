---
title: Ligatures in CSS
tags: [CSS]
description: Implement fancy typographic ligatures with just CSS.
---

Headings can benefit from nice ligatures. Use the [font-feature-settings](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings) CSS property to enable these OpenType features.

```css
.headings {
  /* don't display digraphs in languages that don't support it */
  font-language-override: normal;

  /* use font-defined kerning info */
  font-kerning: auto;

  /* opentype options: kerning, ligatures, horiz ligatures,
   * discretionary ligatures, contextual swash */
  font-feature-settings: "kern", "liga", "dlig", "hlig", "cswh";

  /* allow browser to auto-infer missing glyphs */
  font-synthesis: weight style;
}
```

Here is what they would look like with EB Garamond. Be sure to also check [List of OpenType features](http://en.wikipedia.org/wiki/List_of_typographic_features) for more features you can use.

![](images/ligatures.png)

### Use brick.im
Fonts from Typekit and Google Web Fonts may be stripped of all these extra OpenType information. Use fonts from [brick.im](http://brick.im/) instead.

### Swashes
First letters can look good with swashes (eg, an `R` with an extra long stem). Just be sure to turn this on on a as-needed basis since it may overlap with the rest of the text.

```css
.headings:first-letter {
  font-feature-settings: "kern", "swsh";
}
```
