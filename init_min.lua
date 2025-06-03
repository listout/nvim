-- Change leader to a comma
vim.g.mapleader = ','

vim.cmd.colorscheme "retrobox"

vim.api.nvim_create_user_command('Q', 'qa!', {})
