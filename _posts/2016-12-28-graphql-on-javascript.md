---
title: GraphQL on JavaScript
tags: [JavaScript]
description: Use graphql.js's buildSchema to write schemas in GraphQL's schema language.
---

The de-facto GraphQL package in JavaScript, [graphql] (https://www.npmjs.com/package/graphql), is a bit verbose. Use [buildSchema()] (http://graphql.org/graphql-js/utilities/#buildschema) to make your life easier. You can use GraphQL's schema definition language to write your schemas.

```js
import { graphql, buildSchema } from 'graphql'

const schema = bulidSchema(`
  type Query {
    hello: String
  }
)`

const root = {
  hello () { return 'world' }
}

graphql(schema, '{ hello }', root)
  .then(res => { console.log(res) })
// => { data: { hello: 'world' } }
```

Without *buildSchema()*, you'll have to write it using lower-level classes:

```js
import {
  graphql,
  GraphQLSchema,
  GraphQLObjectType,
  GraphQLString
} from 'graphql'

var schema = new GraphQLSchema({
  query: new GraphQLObjectType({
    name: 'RootQueryType',
    fields: {
      hello: {
        type: GraphQLString,
        resolve() { return 'world' }
      }
    }
  })
})

graphql(schema, '{ hello }')
  .then(res => { console.log(res) })
// => { data: { hello: 'world' } }
```

You can see an example in the graphql.js documentation's [home page] (http://graphql.org/graphql-js/#writing-code).
