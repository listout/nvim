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

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
