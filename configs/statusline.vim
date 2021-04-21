set laststatus=2
if !has('gui_running')
	set t_Co=256
endif

set noshowmode

function! StatusDiagnostic() abort
	let info = get(b:, 'coc_diagnostic_info', {})
	if empty(info) | return '' | endif
	let msgs = []
	if get(info, 'error', 0)
		call add(msgs, 'E' . info['error'])
	endif
	if get(info, 'warning', 0)
		call add(msgs, 'W' . info['warning'])
	endif
	return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

set statusline=
set statusline^=%{StatusDiagnostic()}
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ "

"set statusline^=%{coc#status()}%{get(b:,coc_current_function','')}

"function! CocCurrentFunction()
	"return get(b:, 'coc_current_function', '')
"endfunction


"let g:lightline = {
			"\ 'colorscheme': 'default',
			"\ 'active': {
			"\   'left': [ [ 'mode', 'paste' ],
			"\             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
			"\ },
			"\ 'component_function': {
			"\   'cocstatus': 'coc#status',
			"\   'currentfunction': 'CocCurrentFunction'
			"\ },
			"\ }
