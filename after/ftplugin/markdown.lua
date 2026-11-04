-- Table mode (buffer-local where appropriate)
vim.b.table_mode_corner = "|"
vim.b.table_mode_corner_corner = "|"
vim.b.table_mode_header_fillchar = "-"
vim.g.table_mode_align_char = ":"

-- Spell + wrapping
vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_us" }
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = "72"

-- Do not highlight concealed text (window-local, does not affect other buffers)
vim.opt_local.winhighlight:append({ Conceal = "Normal" })

-- Make `gf` create new files if not exists (buffer-local mapping)
vim.keymap.set("n", "gf", function()
	-- magic.file = false: don't expand %, #, etc. in the file name
	vim.cmd.edit({ args = { vim.fn.expand("<cfile>") }, magic = { file = false } })
end, { buffer = true, silent = true })
