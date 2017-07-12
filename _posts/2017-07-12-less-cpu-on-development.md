---
title: Use less CPU for Rails
tags: [Development]
description: Is Rails eating your CPU in development? Try this nifty trick.
---

Is Rails eating your CPU in development? Try lowering its priority using [renice(1)](http://manpages.ubuntu.com/manpages/zesty/en/man1/renice.1.html), a standard BSD utility that should be available in OS X and most Linux distributions. Here's a shell script that will automatically reset the priority to `+15` to common development processes:

```
#!/usr/bin/env sh
sudo renice +15 -p $(ps ax | grep -E 'ruby|node|watchman|postgres' | grep -v grep | awk '{print $1}' | tr '\n' ' ')
```

Save this as `renice-dev` into one of your `bin` paths, and give it a `chmod +x renice-dev`. You can type `renice-dev` after you start your development processes to "renice" them.

The lowest priority is `+19` (only run when nothing else is running), the default is `0`, and the highest is `-20` (makes things go very fast).

## References

- [Throttling processes in OS X](https://tinyapps.org/blog/mac/201107230700_throttle_process_os_x.html) *(tinyapps.org)*
