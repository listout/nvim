return {
	{
		"neovim/nvim-lspconfig",
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			local lspconfig = require('lspconfig')
			vim.lsp.config('lua_ls', {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = 'LuaJIT'
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
								-- Depending on the usage, you might want to add additional paths here.
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							}
							-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
							-- library = vim.api.nvim_get_runtime_file("", true)
						}
					})
				end,
				settings = {
					Lua = {}
				}
			})
			lspconfig.lua_ls.setup {}

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})

			local signs = { Error = "󰅚 ", Warn = " ", Hint = " ", Info = " " }
			vim.diagnostic.config({
				signs = {
					enable = true,
					text = {
						["ERROR"] = signs.Error,
						["WARN"] = signs.Warn,
						["HINT"] = signs.Hint,
						["INFO"] = signs.Info,
					},
					texthl = {
						["ERROR"] = "DiagnosticDefault",
						["WARN"] = "DiagnosticDefault",
						["HINT"] = "DiagnosticDefault",
						["INFO"] = "DiagnosticDefault",
					},
					numhl = {
						["ERROR"] = "DiagnosticDefault",
						["WARN"] = "DiagnosticDefault",
						["HINT"] = "DiagnosticDefault",
						["INFO"] = "DiagnosticDefault",
					},
				}
			})

			vim.o.updatetime = 250
			-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
			-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
			vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#4c4f69]]
			vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

			local border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			-- To instead override globally
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			--- In .nvim.lua of your project paste in this
			---
			--- require'lspconfig'.clangd.setup{
			--- 	on_attach = require("plugins.lsp-config").on_attach,
			--- 	cpabilities = require("plugins.lsp-config").cpabilities,
			--- 	lsp_flags = require("plugins.lsp-config").lsp_flags,
			--- 	cmd = {vim.fn.expand('~/esp/esp-clang/bin/clangd')}
			--- }
		end,
	},
}
