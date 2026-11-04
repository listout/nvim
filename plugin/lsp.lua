vim.lsp.enable({
	"lua_ls",
	"clangd",
	"basedpyright"
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- Neovim already provides these globally (see :h lsp-defaults):
		--   K hover, grn rename, gra code action, grr references,
		--   gri implementation, grt type definition, gO document symbols,
		--   grx codelens, <C-s> (insert) signature help, [d / ]d diagnostics.
		-- Only mappings without a default are defined here.
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

local signs = { Error = "󰅚 ", Warn = " ", Hint = " ", Info = " " }
local sev = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[sev.ERROR] = signs.Error,
			[sev.WARN] = signs.Warn,
			[sev.HINT] = signs.Hint,
			[sev.INFO] = signs.Info,
		},
	},
})

-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#4c4f69]]
-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
