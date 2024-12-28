return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		{
			'nvim-treesitter/nvim-treesitter-context',
			opts = {
				-- Avoid the sticky context from growing a lot.
				max_lines = 3,
				-- Match the context lines to the source code.
				multiline_threshold = 1,
				-- Disable it when the window is too small.
				min_window_height = 20,
			},
			keys = {
				{
					'[c',
					function()
						-- Jump to previous change when in diffview.
						if vim.wo.diff then
							return '[c'
						else
							vim.schedule(function()
								require('treesitter-context').go_to_context()
							end)
							return '<Ignore>'
						end
					end,
					desc = 'Jump to upper context',
					expr = true,
				},
			},
		},
	},
	build = ':TSUpdate',
	opts = {
		-- A list of parser names, or "all"
		ensure_installed = { "c", "lua", "cpp", "markdown", "markdown_inline", "vim", "regex", "vimdoc" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = true,

		-- Automatically install missing parsers when entering buffer
		auto_install = false,

		-- List of parsers to ignore installing (for "all")
		ignore_install = { "javascript" },

		highlight = {
			-- `false` will disable the whole extension
			enable = true,

			-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
			-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
			-- the name of the parser)
			-- list of language that will be disabled
			-- disable = { "c", "rust" },
			disable = { "markdown" },

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},

		indent = true,
	},
}
