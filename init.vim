let g:markdown_fenced_languages = [
			\ 'html',
			\ 'python',
			\ 'bash=sh',
			\ 'java',
			\ 'c',
			\ 'cpp',
			\ 'php',
			\ 'sql',
			\ 'js=javascript',
			\ 'pro=prolog',
			\ 'vim',
			\ 'help',
			\ ]
let g:pandoc#syntax#codeblocks#embeds#langs = [
			\ "php",
			\ "html",
			\ "bash=sh",
			\ "java",
			\ "c",
			\ "cpp",
			\ "python",
			\ "sql",
			\ "js=javascript",
			\ 'pro=prolog',
			\ 'vim',
			\ 'help',
			\ ]

let g:markdown_syntax_conceal = 1
let g:markdown_minlines = 100

let g:tex_flavor='latex'

"let ch_syntax_for_h = 1

augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.md :syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart

if &diff
source $HOME/.config/nvim/configs/plugins.vim
source $HOME/.config/nvim/configs/basic.vim
source $HOME/.config/nvim/configs/appearance.vim
source $HOME/.config/nvim/configs/statusline.vim
else
source $HOME/.config/nvim/configs/plugins.vim
source $HOME/.config/nvim/configs/basic.vim
source $HOME/.config/nvim/configs/appearance.vim
source $HOME/.config/nvim/configs/statusline.vim
source $HOME/.config/nvim/configs/coc.vim
source $HOME/.config/nvim/configs/snippets.vim
source $HOME/.config/nvim/configs/keys.vim
source $HOME/.config/nvim/configs/fzf.vim
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "c", "cpp", "vim" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,


	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "c", "rust" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},
}
EOF

let g:AutoPairsCenterLine = 0
let g:AutoPairsMapSpace = 0
let g:AutoPairsMapCR = 0

let g:c_syntax_for_h = 1
