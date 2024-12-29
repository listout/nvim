--
-- Mainly filetype settings
--

local cmd = vim.cmd
local u = require('utils')

u.create_augroup({
	{ 'BufRead,BufNewFile', '/tmp/nail-*', 'setlocal', 'ft=mail' },
	{ 'BufRead,BufNewFile', '*s-nail-*', 'setlocal', 'ft=mail' },
	{ 'BufRead,BufNewFile', '*mutt-*', 'setlocal', 'ft=mail' },
	{ 'BufRead', '/tmp/*mutt-*', 'setlocal', 'tw=72' },
}, 'ftmail')

-- Autoremove unwanted whitespaces
cmd [[
	au BufRead,BufNewFile *mutt-* setfiletype mail
]]

-- Add in the following like to auto remove empty lines
-- au BufWritePre * %s/\s\+$//e
