local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Color scheme
	{ "rktjmp/lush.nvim" },
	{ "metalelf0/jellybeans-nvim" },

	-- Treesitter integration
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},

	-- Completion and language server
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp"
	},
	{ "rafamadriz/friendly-snippets" },
	{
		"petertriho/cmp-git",
		dependencies = "nvim-lua/plenary.nvim"
	},
	{ "micangl/cmp-vimtex" },

	-- Productivity plugins
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

	-- Writing
	{
		"junegunn/goyo.vim",
		ft = { 'markdown', 'markdown.pandoc', 'tex', 'c' }
	},
	{
		"junegunn/limelight.vim",
		ft = { 'markdown', 'markdown.pandoc', 'tex', 'c' }
	},
	{
		"vim-pandoc/vim-pandoc",
		ft = { 'markdown', 'markdown.pandoc' },
		lazy = false
	},
	{
		"vim-pandoc/vim-pandoc-syntax",
		ft = { 'markdown', 'markdown.pandoc' },
		lazy = false
	},
	{
		"lervag/vimtex",
		ft = { 'tex' },
		lazy = false
	},

	-- Git intigration
	{ "tpope/vim-fugitive", },

	-- Show git signs and stage hunks
	{ "lewis6991/gitsigns.nvim" },

	-- Status Line
	{ "nvim-lualine/lualine.nvim" },

	-- File tree
	{ "nvim-tree/nvim-tree.lua" }
})
