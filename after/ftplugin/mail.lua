-- Detect mutt temporary files as mail
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "/tmp/mutt-*", "/tmp/neomutt-*" },
	callback = function()
		vim.bo.filetype = "mail"
	end,
})

-- Set options for mutt temp files in /tmp
vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "/tmp/mutt-*", "/tmp/neomutt-*" },
	callback = function()
		vim.opt_local.textwidth = 72
	end,
})

-- Mail ftplugin settings
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = "72"
vim.opt_local.spell = true
