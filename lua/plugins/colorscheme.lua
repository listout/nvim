return {
	{
		"EdenEast/nightfox.nvim",
		lazy = true, -- loaded on :colorscheme
	},
	{
		"metalelf0/jellybeans-nvim",
		dependencies = { 'rktjmp/lush.nvim' },
		priority = 1000,
		lazy = false,
	},
}
