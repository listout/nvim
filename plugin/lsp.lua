vim.lsp.enable({
	"lua_ls"
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
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
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
