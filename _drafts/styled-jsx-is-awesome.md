# CSS-in-JavaScript

[styled-jsx] has been my preferred way of integrating CSS in JavaScript. It lets me write CSS in a more declarative fashion, just like CSS should be. It leads to code that's easier to understand.

Before I tell you why I prefer _styled-jsx_, let's learn about some programming concepts&mdash;It'll all make sense later, trust me!

## Imperative vs. declarative code

There are two styles of expressing data. The most common way is to simply write it out as a data structure. We can call this a **declarative** style of writing, where we try to express logic without providing any instructions.

```js
{
  "name": "my-js-package",
  "description": "A sample package",
  "author": "Rico Sta. Cruz"
}
```

There are cases when this style may not be flexible enough, so some systems take an **imperative** approach. In contrast to the declarative style, it's a piece of code with instructions that runs procedurally. Here's an example of a Ruby [gem specification](https://guides.rubygems.org/specification-reference/), which defines a Ruby package's metadata:

```rb
Gem::Specification.new do |spec|
  spec.name = 'my-ruby-gem'
  spec.summary = 'A sample package'
  spec.authors = ['Rico Sta. Cruz']
end
```

## But they look the same!

Ruby's gem specification style is _imperative_ because we're issuing instructions that are to be ran sequentially. It can keep variables, call functions, and do all the things you can do in a Ruby program. Think of the Ruby gemspec as a program talking to the system:

> - _Okay, computer. Build a new Gem specification._
> - _Set the name to 'my-ruby-gem'._
> - _Set the summary to 'A sample package'._
> - _Finish building._

On the other hand, JavaScript's _declarative_ style isn't concerned with any instructions or control flow. It's not a code that talks to your system, it's really just a table of keys and values.

## Imperative is powerful

Imperative style gives you the power to write expressions that you can't easily do with a declarative-style conventions. For instance, here's an example gem specification where the list of files are gathered via a system command (`git ls-files`):

```rb
Gem::Specification.new do |spec|
  spec.name = 'my-gem'
  spec.summary = 'This is my gem'
  spec.files = `git ls-files -z`.split("\x0")
end
```

## Declarative is easier to understand

Imperative conventions give developers a great amount of flexibility. However, this power comes at the cost of _complexity_. Here's an example where development dependencies are _imperatively_ defined in a Ruby gem, taking advantage of Ruby's `Array#each` to reduce redundancy.

```rb
Gem::Specification.new do |spec|
  ['bundler', 'rake', 'minitest', 'rails'].each do |gemname|
    spec.add_development_dependency(gemname)
  end
end
```

In contrast, here's how it may be _declaratively_ defined in a JavaScript package's `package.json`.

```js
{
  "dependencies": {
    "react": "^16.0.0",
    "react-dom": "^16.0.0",
    "redux": "^4.0.1"
  }
}
```

JavaScript's _declarative aproach_ may be less flexible than the _imperative_ one, but the constraints of a JSON format makes things more predictable and easier to glance.

## CSS is declarative

CSS is beautifully declarative. To write CSS is to write a list of rules, not a set of instructions. For instance, we would say _buttons are supposed to be blue_, rather than _turn all buttons to blue_.

```css
/* "Buttons are supposed to be blue" in CSS. */
button {
  background: blue;
}
```

```js
// "Turn all buttons to blue" in JavaScript.
// (Please don't do this.)
Array.from(document.querySelectorAll('button')).forEach(button => {
  button.style.background = 'blue'
})
```

## A lot of JS-in-CSS is imperative

At first glance, we can say that most JS-in-CSS solutions require you to write in a declarative style, since it's mostly just taking CSS and putting it in JavaScript. Here's how you would define a blue button using [styled-components]:

```js
const Button = styled.a`
  background: blue;
`
```

However, how would you start making red `danger` buttons? With _styled-components_, you'll have to provide a function which returns a CSS fragment depending on how you would interpret `props`:

```js
// using styled-components
const Button = styled.a`
  background: blue;

  ${props =>
    props.danger &&
    css`
      background: red;
    `};
`
```

This is where it starts to break down. We're now mixing the declarative nature of CSS with some rules that are written in an imperative style. We're also now interweaving 2 languages together&mdash;CSS and JavaScript&mdash;where your brain may have to switch contexts mid-way. This brain-context-switching is even more apparent in some other CSS-in-JS libraries:

```css
// using emotion
const Button = styled.a`
  background: ${props => props.danger ? 'red' : 'blue'};
  opacity: ${props => props.isHidden ? 0 : 1};
`
```

## Declarative CSS with styled-jsx

[styled-jsx] has been my preferred way of integrating CSS in JavaScript. It lets me write CSS in a more declarative fashion, just like CSS should be. It also minimizes the interweaving of CSS and JavaScript code.

How would you style a danger button differently in _styled-jsx_? Just use CSS classes as you normally would. Simple!

```js
const Button = ({ children, danger }) => {
  return (
    <a className={`button ${danger ? 'danger' : ''}`}>
      {children}
      <style jsx>{style}</style>
    </a>
  )
}

const style = css`
  .button {
    background: blue;
  }

  .button.danger {
    background: red;
  }
`
```

[styled-components]: https://www.styled-components.com/
[styled-jsx]: https://github.com/zeit/styled-jsx
[emotion]: https://emotion.sh/
