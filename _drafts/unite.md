Unite.vim is one of those things I keep on trying but eventually give up on because it's slow.

### Attempt 1

```vim
nnmap <C-p> :<C-u>Unite -start-insert file_rec/async<CR>
```

### Problems

* it shows full paths.
* matching is not fuzzy.
* hidden files are shown.

Solutions:

* Use converter_relative_word
* Use matcher_fuzzy
* Use hide_hidden_files

### Problem

* gitignore is not handled
* use ag

### Problem

* sorting sucks
* Use selecta

### Problem

It's slow. Use resume

