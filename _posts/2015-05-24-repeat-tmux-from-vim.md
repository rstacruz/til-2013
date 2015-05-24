---
title: Running tests using Vim and Tmux
tags: [Vim]
image: images/tmux-repeat.gif
description: The most intuitive way for me to run tests is to use tmux split panes.
hljs_languages: [vim]
---

![Image]({{ page.image }})
{:.full-image.cropped.bottom-space-4}

### Using split panes
The most intuitive way for me to run tests is to use a tmux split pane. I
simply split my screen between my editor and a shell that runs tests (`npm
test` in this example). I've then set up a vim hotkey (`,r` for me) to quickly send "up enter" to the last tmux pane used.

```vim
" Repeat last command in the next tmux pane.
nnoremap <Leader>r :call <SID>TmuxRepeat()<CR>

function! s:TmuxRepeat()
  silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"
  redraw!
endfunction
```

### Save-and-repeat
Even better, I've set up `Ctrl-S` as a "save-and-repeat" key to make it all happen in one keystroke:

```vim
inoremap <C-s> <Esc>:w<CR>:call <SID>TmuxRepeat()<CR>a
noremap  <C-s> :w<CR>:call <SID>TmuxRepeat()<CR>
```

----

Alternatively, you can use [vim-dispatch], but it doesn't support colors and can be disorienting.

[vim-dispatch]: https://github.com/tpope/vim-dispatch
