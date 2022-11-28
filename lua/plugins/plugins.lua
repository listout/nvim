-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
	vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer_init.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Only required if you have packer configured as `opt`
return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Color scheme
	use 'Yazeed1s/oh-lucy.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }

	-- File tree
	use 'nvim-tree/nvim-tree.lua'

	-- Completion and language server
	use {'neovim/nvim-lspconfig'} -- Collection of configurations for built-in LSP client
	use {'hrsh7th/cmp-nvim-lsp'} -- LSP source for nvim-cmp
	use {'hrsh7th/cmp-buffer'} -- LSP source nvim-cmp
	use {'hrsh7th/cmp-path'} -- LSP source for nvim-cmp
	use {'hrsh7th/cmp-cmdline'} -- LSP source nvim-cmp
	use {'hrsh7th/cmp-nvim-lsp-signature-help'}
	use {'hrsh7th/nvim-cmp'} -- Autocompletion plugin
	use {'hrsh7th/cmp-nvim-lua'}
	use {'saadparwaiz1/cmp_luasnip'} -- Snippets source for nvim-cmp
	use {'L3MON4D3/LuaSnip'} -- Snippets plugin
	use {"rafamadriz/friendly-snippets"}

	-- Show color under hex codes
	use {'norcalli/nvim-colorizer.lua'}

	-- Productivity plugins
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use {'preservim/nerdcommenter'} -- Easy commenting
	use {'dhruvasagar/vim-table-mode', ft = {'markdown', 'markdown.pandoc'} } -- Markdown easy tables
	use {'junegunn/fzf', run = ":call fzf#install()" }
	use {'junegunn/fzf.vim' } -- Fuzzy file finding
	use {'tpope/vim-surround'} -- Easy surrounding with brackets, quotes ...
	use {'junegunn/vim-easy-align'} -- Easy aling with space, = ...

	-- Writing
	use {'junegunn/goyo.vim', ft = {'markdown', 'markdown.pandoc'}}
	use {'junegunn/limelight.vim', ft = {'markdown', 'markdown.pandoc'}}

	use { 'vim-pandoc/vim-pandoc-syntax', ft = { 'markdown', 'markdown.pandoc' } }
	use { 'lervag/vimtex', ft = { 'tex' } }

	-- Git intigration
	use { 'tpope/vim-fugitive', ft = {'cpp', 'c'} }

	-- Treesitter integration
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Better per project settings
	use { 'jenterkin/vim-autosource' }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
