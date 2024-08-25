-- If neovim remote is not installed, install it
if vim.fn.executable('nvr') == 0 then
	vim.api.nvim_command('!pip3 install --user --break-system-packages neovim-remote')
end

-- Options to add `gf` functionality inside `.lua` files.
-- https://github.com/sam4llis/nvim-lua-gf/blob/ca712497b2bab6351518917be219e9bfd8d63e4f/after/ftplugin/lua.lua
_G.vim.opt_local.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
_G.vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"
for _, path in pairs(_G.vim.api.nvim_list_runtime_paths()) do
_G.vim.opt_local.path:append(path .. '/lua')
end
_G.vim.opt_local.suffixesadd:prepend('.lua')

local function get_hostname()
	local f = io.open("/etc/hostname")
	local hostname = f:read("*a") or ""
	f:close()
	hostname = string.gsub(hostname, "\n$", "")
	return hostname
end

-- Load plugins
require('keymaps')
require('basics')
require('ftsettings')
require('appearance')
if get_hostname() ~= "shoggoth" then
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
end
