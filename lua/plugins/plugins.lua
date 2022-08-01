-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Nord color scheme
	use 'shaunsingh/nord.nvim'

	-- Completion
	use {'neoclide/coc.nvim', branch = 'release'}


	use {'ap/vim-css-color'}

	use {'jiangmiao/auto-pairs'}
	use {'preservim/nerdcommenter'}
	use { 'dhruvasagar/vim-table-mode', ft = {'markdown', 'markdown.pandoc'} }

	use { 'vim-pandoc/vim-pandoc-syntax', ft = { 'markdown', 'markdown.pandoc' } }
	use { 'lervag/vimtex', ft = { 'tex' } }

	use { 'junegunn/fzf', run = ":call fzf#install()" }
	use { 'junegunn/fzf.vim' }

	use { 'honza/vim-snippets' }
	use { 'SirVer/ultisnips' }

	use {'tpope/vim-surround'}
	use {'junegunn/vim-easy-align'}


	use { 'tpope/vim-fugitive', ft = {'cpp', 'c'} }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
