" Table mode
let b:table_mode_corner='|'
let b:table_mode_corner_corner='|'
let b:table_mode_header_fillchar='-'
let g:table_mode_align_char=':'

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal=0
let g:vim_markdown_anchorexpr="'<<'.v:anchor.'>>'"

" Spell checking
set spell spelllang=en_us
set textwidth=80
set colorcolumn=80

" Does not highlight conceal
highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Make `gf` create new files if not exists
map gf :e <cfile><CR>

" Auto complete for $ in pandoc markdown
let g:AutoPairs = {
			\ "`":"`",
			\ "$":"$",
			\ "$$":"$$",
			\ "```":"```",
			\ "(":")",
			\ "[":"]",
			\ "{":"}",
			\ "( ": " )",
			\ "[ ": " ]",
			\ "{ ": " }",
			\ }
let java_ignore_javadoc=1
