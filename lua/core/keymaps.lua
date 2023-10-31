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

map('n', '<leader>B', ':Buffers<CR>') -- FZF show open buffers
map('n', '<leader>F', ':Files<CR>')   -- FZF show files
map('n', '<leader>A', ':Rg<CR>')      -- FZF call ripgrep
map('n', '<leader>C', ':Commits<CR>') -- FZF show git commits
map('n', '<leader>M', ':Maps<CR>')    -- FZF show normal mode mappings

map('n', '<leader>e', ':NvimTreeToggle<CR>')
