-- Neovim init file
if vim.fn.executable('nvr') == 0 then
	vim.api.nvim_command('!pip3 install --user neovim-remote')
end

-- Import Lua modules
require('plugins.plugins')
require('plugins.cmp')
require('plugins.lsp-config')
require('plugins.usnippet')
require('plugins.statusline')
require('plugins.treesitter')
require('plugins.vimtex')
require('plugins.nvim-tree')
require('plugins.gitsigns')

require('core.colorscheme')
require('core.appearance')
require('core.options')
require('core.utils')
require('core.settings')
require('core.keymaps')

require'colorizer'.setup()
