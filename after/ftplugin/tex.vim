" Does not highlight conceal (window-local, does not affect other buffers)
setlocal winhighlight+=Conceal:Normal

" Conceal
setlocal conceallevel=1

" Spell checking
setlocal spell spelllang=en_us
setlocal textwidth=80

" VimTeX globals live in lua/plugins/writing.lua (they must be set before
" VimTeX loads).
