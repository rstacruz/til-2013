---
title: "Hosting static sites in Heroku"
tags: [Development]
---

Just add an `index.php` to your repository.
It tells Heroku that the site is a PHP site and that it will be hosted using 
Apache.
{:.brief-intro.center}

    touch index.php

And yes, you can still have an `index.html` file. The `.html` file takes 
precedence over the `.php` one. Have fun!
