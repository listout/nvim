-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

map('n', 'M-j', ':resize -2<CR>')
map('n', 'M-k', ':resize +2<CR>')
map('n', 'M-l', ':vertical resize -2<CR>')
map('n', 'M-h', ':vertical resize +2<CR>')

map('t', 'C-w', '<C-\\><C-n><C-w>')

map('n', '<leader>b', ':Buffers<CR>');
map('n', '<leader>n', ':Files<CR>');

vim.cmd([[
	let $FZF_DEFAULT_COMMAND =  "find * -path
			\ '*/\.*' -prune -o -path 'node_modules/**'
			\ -prune -o -path 'target/**' -prune -o -path
			\'dist/**' -prune -o  -type f -print -o -type
			\ l -print 2> /dev/null"
]])

map('n', '<silent><leader>l', ':Buffers<CR>')

