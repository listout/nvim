-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local use = require('packer').use
return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Nord color scheme
	use 'arzg/vim-substrata'

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

	-- Show color under hex codes
	use {'ap/vim-css-color'}

	-- Productivity plugins
	use {'jiangmiao/auto-pairs'} -- Auto add matching brackets
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
	use { 'windwp/nvim-projectconfig' }
	--[[
	   [use {
	   [    "klen/nvim-config-local",
	   [    config = function()
	   [        require('config-local').setup {
	   [            -- Default configuration (optional)
	   [            config_files = { ".vimrc.lua", ".vimrc" },  -- Config file patterns to load (lua supported)
	   [            hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
	   [            autocommands_create = true,                 -- Create autocommands (VimEnter, DirectoryChanged)
	   [            commands_create = true,                     -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
	   [            silent = false,                             -- Disable plugin messages (Config loaded/ignored)
	   [            lookup_parents = true,                      -- Lookup config files in parent directories
	   [        }
	   [    end
	   [}
	   ]]

	--[[ Most probably not needed anymore
	   [use { 'honza/vim-snippets' }
	   [use { 'SirVer/ultisnips' }
	   ]]


end)
