--[[
Neovim init file
--]]

-- Import Lua modules
require('core.colorscheme')
require('core.appearance')
require('core.options')
require('core.utils')
require('core.settings')
require('core.keymaps')

require('plugins.plugins')
require('plugins.cmp')
require('plugins.lsp-config')
require('plugins.usnippet')
require('plugins.statusline')
require('plugins.treesitter')

-- Per project configuration
require('nvim-projectconfig').setup()
