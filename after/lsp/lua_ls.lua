-- Overrides on top of nvim-lspconfig's lsp/lua_ls.lua.
-- (lazydev.nvim adds the Neovim runtime/plugin library for Neovim configs.)
return {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
		},
	},
}
