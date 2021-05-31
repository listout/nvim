let g:vimwiki_global_ext=0
let g:vimwiki_table_mappings=0
let g:vimwiki_table_auto_fmt=0
let g:vimwiki_list = [{'path': '~/Documents/notes',
			\ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown',
			\ '.mkd': 'markdown',
			\ '.wiki': 'media'}

" Pandoc sytax work with vimwiki filetype
augroup pandoc_syntax
	autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END

" Prevent remapping <CR> so i can interact with an open OmniCompletion popup
inoremap <expr> <CR>   pumvisible() ? "\<CR>"   : "<Esc>:VimwikiReturn 1 5<CR>"
inoremap <expr> <S-CR> pumvisible() ? "\<S-CR>" : "<Esc>:VimwikiReturn 2 2<CR>"
