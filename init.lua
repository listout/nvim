-- If neovim remote is not installed, install it
if vim.fn.executable('nvr') == 0 then
	vim.api.nvim_command('!pip3 install --user --break-system-packages neovim-remote')
end

-- Experimental redesigned message/cmdline UI (nvim 0.12+, see :h ui2).
-- Replaces hit-enter prompts; pcall in case the module moves on master.
pcall(function()
	require("vim._core.ui2").enable({})
end)

-- Change leader to a comma
vim.g.mapleader = ','

require("config.lazy")
require("config.autocmds")
vim.cmd.colorscheme "jellybeans-nvim"
