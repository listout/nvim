let g:vimwiki_global_ext=0
let g:vimwiki_table_mappings=0
let g:vimwiki_table_auto_fmt=0
let g:vimwiki_list = [{
			\ 'path': '~/Documents/notes',
			\ 'syntax': 'markdown', 'ext': '.md',
			\ 'custom_wiki2html': '~/.local/bin/wiki2html.sh'
			\ }]

let g:vimwiki_ext2syntax = {'.md': 'markdown',
			\ '.mkd': 'markdown',
			\ '.wiki': 'media'}

" Pandoc sytax work with vimwiki filetype
augroup pandoc_syntax
	autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END

augroup ft_vimwiki
	au!

	" Automatically generate a header for new wiki pages.
	" NOTE: Waiting for g:vimwiki_auto_header to get added. Think it's still in the dev branch.
	" Prevent remapping <CR> so i can interact with an open OmniCompletion popup:
	" SOURCE: https://github.com/vimwiki/vimwiki/blob/master/doc/vimwiki.txt#L1491
	" SOURCE: https://github.com/vimwiki/vimwiki/issues/283
	au FileType vimwiki inoremap <silent> <buffer> <expr> <CR>
				\ pumvisible() ? "\<CR>"   : "<Esc>:VimwikiReturn 1 5<CR>"
	au FileType vimwiki inoremap <silent> <buffer> <expr> <S-CR>
				\ pumvisible() ? "\<S-CR>" : "<Esc>:VimwikiReturn 2 2<CR>"
augroup END

au filetype vimwiki silent! iunmap <buffer> <Tab>
