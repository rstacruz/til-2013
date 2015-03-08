---
title: Easily make favicon.ico
tags: [Development]
description: Never look for a favicon generator again.
---

To create `favicon.ico`, you don't need anything other than ImageMagick.

    brew install imagemagick
    sudo apt-get install imagemagick

Use it to convert PNG's into .ico: (use 32px and 16px sizes for retina compatibility)

    convert favicon-32.png favicon-16.png favicon.ico

You can even use it to generate a 16px version from a 32px:

    convert favicon-32.png -resize 16x16 favicon16.png
