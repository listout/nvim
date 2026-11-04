--
-- Mainly filetype settings
--

-- .h files: Neovim's built-in detection picks c, cpp or objcpp based on the
-- header's contents. To force C for every header, set:
--   vim.g.c_syntax_for_h = 1
vim.filetype.add {
	extension = {
		scheme = "scheme",
	},
}

-- Add in the following like to auto remove empty lines
-- au BufWritePre * %s/\s\+$//e
