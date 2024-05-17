-- If neovim remote is not installed, install it
if vim.fn.executable('nvr') == 0 then
	vim.api.nvim_command('!pip3 install --user --break-system-packages neovim-remote')
end

-- Load plugins
require('keymaps')
require('basics')
require('ftsettings')
require('appearance')
require('plugin')
require('plugins.lualine')
require('plugins.autopair')
require('plugins.colorscheme')
require('plugins.lsp')
require('plugins.completion')
require('plugins.gitsigns')
require('plugins.nvim-tree')
require('plugins.treesitter')
require('plugins.usnippet')
require('plugins.vimtex')
