-- Neovim init file
if vim.fn.executable('nvr') == 0 then
	vim.api.nvim_command('!pip3 install --user --break-system-packages neovim-remote')
end

-- Import Lua modules
require('plugins.plugins')
require('plugins.cmp')
require('plugins.lsp-config')
require('plugins.usnippet')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.vimtex')
require('plugins.nvim-tree')
require('plugins.gitsigns')
require('plugins.autopairs')

require('core.appearance')
require('core.options')
require('core.utils')
require('core.settings')
require('core.keymaps')
require('core.colorscheme')

require'colorizer'.setup()
