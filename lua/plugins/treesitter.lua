-- Parsers to install via nvim-treesitter (requires the `tree-sitter` CLI).
local ensure_installed = { "c", "lua", "cpp", "markdown", "markdown_inline", "vim", "regex", "vimdoc" }

-- Languages where treesitter highlighting should not be started.
local highlight_disable = { markdown = true }

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- the main branch does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			if vim.fn.executable("tree-sitter") == 1 then
				-- Async; already-installed parsers are skipped.
				require("nvim-treesitter").install(ensure_installed)
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(ev.match)
					if not lang or highlight_disable[lang] then
						return
					end
					-- pcall: no parser available for this language
					if pcall(vim.treesitter.start, ev.buf, lang) then
						vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
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
				-- Not `[c`: that is gitsigns' previous-hunk mapping.
				"[x",
				function()
					require("treesitter-context").go_to_context(vim.v.count1)
				end,
				desc = "Jump to upper context",
			},
		},
	},
}
