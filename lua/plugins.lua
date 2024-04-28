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
	{ "nvim-treesitter/nvim-treesitter",    build = ":TSUpdate" },

	-- Completion and language server
	{ "neovim/nvim-lspconfig" }, -- Collection of configurations for built-in LSP client
	{ "hrsh7th/cmp-nvim-lsp" },  -- LSP source for nvim-cmp
	{ "hrsh7th/cmp-buffer" },    -- LSP source nvim-cmp
	{ "hrsh7th/cmp-path" },      -- LSP source for nvim-cmp
	{ "hrsh7th/cmp-cmdline" },   -- LSP source nvim-cmp
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/nvim-cmp" },      -- Autocompletion plugin
	{ "hrsh7th/cmp-nvim-lua" },
	{ "saadparwaiz1/cmp_luasnip" }, -- Snippets source for nvim-cmp
	{ "L3MON4D3/LuaSnip" },      -- Snippets plugin
	{ "rafamadriz/friendly-snippets" },
	{ "petertriho/cmp-git",                 dependencies = "nvim-lua/plenary.nvim" },
	{ "micangl/cmp-vimtex" },

	-- Productivity plugins
	{ "windwp/nvim-autopairs" },                                                   -- Auto pairs
	{ "preservim/nerdcommenter" },                                                 -- Easy commenting
	{ "dhruvasagar/vim-table-mode",         ft = { 'markdown', 'markdown.pandoc' } }, -- Markdown easy tables
	{ "junegunn/fzf",                       build = ":call fzf#install()" },
	{ "junegunn/fzf.vim" },                                                        -- Fuzzy file finding
	{ "tpope/vim-surround" },                                                      -- Easy surrounding with brackets, quotes ...
	{ "junegunn/vim-easy-align" },                                                 -- Easy aling with space, = ...

	-- Writing
	{ "junegunn/goyo.vim",                  ft = { 'markdown', 'markdown.pandoc', 'tex', 'c' } },
	{ "junegunn/limelight.vim",             ft = { 'markdown', 'markdown.pandoc', 'tex', 'c' } },
	{ "vim-pandoc/vim-pandoc-syntax",       ft = { 'markdown', 'markdown.pandoc' } },
	{ "lervag/vimtex",                      ft = { 'tex' },                                    lazy = false },

	-- Git intigration
	{ "tpope/vim-fugitive", },

	-- Show git signs and stage hunks
	{ "lewis6991/gitsigns.nvim" },

	-- Status Line
	{ "nvim-lualine/lualine.nvim" },

	-- File tree
	{ "nvim-tree/nvim-tree.lua" }
})
