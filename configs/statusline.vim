set laststatus=2
if !has('gui_running')
	set t_Co=256
endif

set noshowmode

set statusline^=%{coc#status()}%{get(b:,coc_current_function','')}

function! CocCurrentFunction()
	return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
			\ 'colorscheme': 'moonfly',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'cocstatus': 'coc#status',
			\   'currentfunction': 'CocCurrentFunction'
			\ },
			\ }
