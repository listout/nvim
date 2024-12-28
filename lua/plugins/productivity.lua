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
	{ "junegunn/fzf.vim" },
	{ "tpope/vim-surround" },
	{ "junegunn/vim-easy-align" },
}
