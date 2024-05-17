" Does not highlight conceal
highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" VimTex specific settings
set conceallevel=1
let g:tex_conceal='abdmg'

" Spell checking
set spell spelllang=en_us
set textwidth=80

let g:vimtex_quickfix_ignore_filters = [
      \ 'LaTeX Warning: Command \\under\(bar\|line\)  has changed.',
      \ 'Over-specification in `v',
      \ '\\headheight is too small'
      \]
