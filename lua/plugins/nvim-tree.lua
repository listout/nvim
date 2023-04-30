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
		mappings = {
			custom_only = false,
			list = {
				a = 'create',
				d = 'remove',
				l = 'parent_node',
				L = 'dir_up',
				K = 'last_sibling',
				J = 'first_sibling',
				o = 'system_open',
				p = 'paste',
				r = 'rename',
				R = 'refresh',
				t = 'next_sibling',
				T = 'prev_sibling',
				v = 'next_git_item',
				V = 'prev_git_item',
				x = 'cut',
				yl = 'copy_name',
				yp = 'copy_path',
				ya = 'copy_absolute_path',
				yy = 'copy',
				[';'] = 'edit',
				['.'] = 'toggle_ignored',
				['h'] = 'toggle_help',
				['<bs>'] = 'close_node',
				['<tab>'] = 'preview',
				['<s-c>'] = 'close_node',
				['<c-r>'] = 'full_rename',
				['<c-t>'] = 'tabnew',
				['<c-x>'] = 'split',
			},
		},
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
