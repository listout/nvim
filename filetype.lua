--
-- Mainly filetype settings
--

vim.filetype.add {
	extension = {
		h = "c",
		scheme = "scheme",
	},
}

-- Add in the following like to auto remove empty lines
-- au BufWritePre * %s/\s\+$//e
