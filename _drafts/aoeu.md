```
plate() { (cd $1 >/dev/null && git archive HEAD) | tar xv; }
```

tar cf - --exclude .git .

:+1:
