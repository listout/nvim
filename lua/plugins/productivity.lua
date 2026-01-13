return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	},
	{ "preservim/nerdcommenter" },
	{
		"dhruvasagar/vim-table-mode",
		ft = { 'markdown', 'markdown.pandoc', 'pandoc' }
	},
	{
		"junegunn/fzf",
		build = ":call fzf#install()"
	},
	{
		"junegunn/fzf.vim",
		init = function()
			vim.g.fzf_vim = {
				grep_multi_line     = 1,
				preview_window      = { 'hidden,right,50%,<70(up,40%)', 'ctrl-/' },
				buffers_options     = '--style full --border-label " Open Buffers "',
				files_options       = '--style full --border-label " Files "',
				commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"',
			}
		end,
	},
	{ "tpope/vim-surround" },
	{ "junegunn/vim-easy-align" },
}
