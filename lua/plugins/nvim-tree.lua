-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require('nvim-tree').setup({
	sort_by = "case_sensitive",
	on_attach = "disable",
	view = {
		centralize_selection = false,
		cursorline = true,
		debounce_delay = 15,
		width = 34,
		hide_root_folder = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	renderer = {
		group_empty = true,
		highlight_opened_files = "all"
	},
	filters = {
		dotfiles = true,
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},
})
