return {
	{
		"junegunn/goyo.vim",
		ft = { 'markdown', 'markdown.pandoc', 'tex', 'c' }
	},
	{
		"junegunn/limelight.vim",
		ft = { 'markdown', 'markdown.pandoc', 'tex', 'c' }
	},
	{
		"vim-pandoc/vim-pandoc-syntax",
		ft = { 'markdown', 'markdown.pandoc' },
		lazy = false
	},
	{
		"lervag/vimtex",
		lazy = false, -- VimTeX should not be lazy-loaded
		init = function()
			-- Filetype flavor: one of "plain", "context", "latex".
			vim.g.tex_flavor = "latex"
			vim.g.tex_conceal = "abdmg"
			vim.g.vimtex_view_general_viewer = "zathura"
			vim.g.vimtex_quickfix_ignore_filters = {
				[[LaTeX Warning: Command \\under\(bar\|line\)  has changed.]],
				"Over-specification in `v",
				[[\\headheight is too small]],
			}
			-- To build with XeLaTeX instead of pdfLaTeX, uncomment:
			-- vim.g.vimtex_compiler_latexmk_engines = { _ = "-xelatex" }
		end,
	},
}
