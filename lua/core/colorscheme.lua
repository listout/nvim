-- Config in lua
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_italic_functions = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
--[[
   [vim.g.moonlight_italic_comments = true
   [vim.g.moonlight_italic_keywords = true
   [vim.g.moonlight_italic_functions = true
   [vim.g.moonlight_borders = true
   [require('moonlight').set()
   ]]
