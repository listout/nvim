-- If neovim remote is not installed, install it
if vim.fn.executable('nvr') == 0 then
	vim.api.nvim_command('!pip3 install --user --break-system-packages neovim-remote')
end

-- Change leader to a comma
vim.g.mapleader = ','

require("config.lazy")
vim.cmd.colorscheme "jellybeans-nvim"
