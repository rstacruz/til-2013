---
title: "CSS-in-JS showdown: styled-jsx vs. Emotion"
tags: [JavaScript]
secret: true
description: |
  ...
---

There's a lot of solutions for CSS-in-JS. Today we're going to look at `styled-jsx` and `emotion`.
{:.brief-intro.center}

### What's emotion?

It's a library. Check it out: [emotion]. It's available in various flavors:

* [react-emotion]
* [styled-components]

### What's styled-jsx?

It's also a library. Check it out: [styled-jsx].

---

## Dynamic styles

How does each library handle the problem of dynamic styles?
{:.brief-intro.center}

### Emotion — use interpolation

Emotion gives you the option to interpolate inside CSS. This leads us to constructions such as these:

```js
// Emotion
const Block = styled('div')`
  opacity: ${p => (p.isHidden ? '0' : '1')};
  transition: opacity ${p => (p.isHidden ? '300ms' : '50ms')} linear;
`
```

### styled-jsx — use CSS classes

On the other hand, `styled-jsx` prefers that you write your styles in plain CSS. You will end up with longer, but more readable code:

```js
// styled-jsx
const Block = ({ children }) => {
  return (
    <div className={isHidden ? 'hidden' : 'visible'}>
      {children}

      <style jsx>{`
        .visible {
          opacity: 1;
          transition: opacity 50ms linear;
        }

        .hidden {
          opacity: 0;
          transition: opacity 300ms linear;
        }
      `}</style>
    </div>
  )
}
```

### Which is better?

Some people may prefer the terse-ness of the Emotion approach, since it leads to shorter code. On the other hand, styled-jsx is more conducive to a _declarative_ style of writing styles, very similar to how it might be done with plain CSS approaches.

|                 | styled-jsx                       | emotion                  |
| --------------- | -------------------------------- | ------------------------ |
| **Style**       | Declarative :+1:                 | Imperative               |
| **Syntax**      | Mostly just CSS :+1:             | CSS/JS hybrid            |
| **Length**      | Longer code                      | Shorter code :+1:        |
| **Parsability** | Friendlier to CSS designers :+1: | Harder to mentally-parse |

### Winner: styled-jsx

I prefer the `styled-jsx` approach. While dynamic interpolation can lead to shorter code, the "static" style that styled-jsx encourages wins for me.

---

## Handling big components

Components typically have multiple elements in them. How does each library handle this case?
{:.brief-intro.center}

### Emotion — use multiple components

Emotion is (...):

```js
const Profile = () => (
  <Root>
    <Image />
    <Info>
      <Name />
      <Timestamp />
    </Info>
  </Root>
)

const Root = styled.section`
  display: flex;
`
const Image = styled.img`
  width: 32px;
  height: 32px;
`
const Info = styled.div`
  display: flex;
`
const Name = styled.span`
  font-weight: bold;
`
const Timestamp = styled.div`
  font-size: 0.8em;
`
```

### styled-jsx — use HTML elements

styled-jsx is (...):

```js
const Profile = () => (
  <section className="Profile">
    <div className="image" />
    <div className="info">
      <span className="name" />
      <span className="timestamp" />
    </div>

    <style jsx>{`
      .Profile {
        display: flex;
      }
      .image {
        width: 32px;
        height: 32px;
      }
      .info {
        display: flex;
      }
      .name {
        font-weight: bold;
      }
      .timestamp {
        font-size: 0.8em;
      }
    `}</style>
  </section>
)
```

### Comparison

Here's how they compare:

|           | emotion | styled-jsx |
| --------- | ------- | ---------- |
| **Style** | Messy   | Clean      |

## 3rd-party support

styled-jsx supports PostCSS:

```js
const Profile = children => (
  <div className="Profile">
    {children}

    <style jsx>{`
      @import 'styles/variables';

      .Profile {
        color: color(var(--text-color) alpha(50%));
      }
    `}</style>
  </div>
)
```

This allows you stuff:

## Linting

With styled-jsx, your CSS is lintable via [Stylelint], which ensures CSS conventions like variable naming, class-name conventions, and more.

Stylelint support is available to styled-components via [stylelint-processor-styled-components].

## Debuggability

TBD

## Verdict

Well...

[stylelint]: https://github.com/stylelint/stylelint
[stylelint-processor-styled-components]: https://github.com/styled-components/stylelint-processor-styled-components
[styled-components]: https://github.com/styled-components
[styled-jsx]: https://github.com/zeit/styled-jsx
[emotion]: http://emotion.sh/
[react-emotion]: https://www.npmjs.com/package/react-emotion
