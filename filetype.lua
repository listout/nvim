--
-- Mainly filetype settings
--

local cmd = vim.cmd

-- Autoremove unwanted whitespaces
cmd [[
	au BufRead,BufNewFile *mutt-* setfiletype mail
]]

vim.filetype.add {
	extension = {
		h = "c",
		scheme = "scheme",
	},
}

-- Add in the following like to auto remove empty lines
-- au BufWritePre * %s/\s\+$//e
