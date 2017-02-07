```bash
tmp=$(mktemp) && trap 'rm -rf $tmp' EXIT HUP INT QUIT TERM
```

