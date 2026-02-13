-- Table mode (buffer-local where appropriate)
vim.b.table_mode_corner = "|"
vim.b.table_mode_corner_corner = "|"
vim.b.table_mode_header_fillchar = "-"
vim.g.table_mode_align_char = ":"

-- vim-markdown settings (globals expected by the plugin)
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"

-- Spell + wrapping
vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_us" }
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = "72"

-- Do not highlight concealed text
vim.api.nvim_set_hl(0, "Conceal", {
	ctermbg = "NONE",
	ctermfg = "NONE",
	bg = "NONE",
	fg = "NONE",
})

-- Make `gf` create new files if not exists (buffer-local mapping)
vim.keymap.set("n", "gf", function()
	vim.cmd.edit(vim.fn.expand("<cfile>"))
end, { buffer = true, silent = true })

-- Ignore Javadoc in Java (global)
vim.g.java_ignore_javadoc = 1
