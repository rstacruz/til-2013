---
title: "Hosting static sites in Heroku"
tags: [Development, Heroku]
description: Serve simple websites for free using Heroku with this one simple tip.
---

Just add an `index.php` to your repository.
It tells [Heroku](http://heroku.com) that the site is a PHP site and that it will be hosted using 
Apache.
{:.brief-intro.center}

```
touch index.php
```
{:.terminal.large}

And yes, you can still have an `index.html` file. The `.html` file takes 
precedence over the `.php` one. Have fun!
