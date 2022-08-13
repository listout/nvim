-- Config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true

--[[
   [vim.g.tokyonight_style = "night"
   [vim.g.tokyonight_italic_functions = 1
   ]]

-- Load the colorscheme
require('nord').set()
-- vim.cmd[[colorscheme nord]]
