return {
	-- Provides maintained lsp/<server>.lua configs on 'runtimepath'.
	-- Files in this config's lsp/ directory are merged on top (see :h lsp-config-merge),
	-- so they only need local overrides. Servers are enabled in plugin/lsp.lua.
	{ "neovim/nvim-lspconfig", lazy = false },

	-- Neovim Lua API types/completion for lua_ls when editing Neovim config/plugins.
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luv types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
