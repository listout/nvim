-- If neovim remote is not installed, install it
if vim.fn.executable('nvr') == 0 then
	vim.api.nvim_command('!pip3 install --user --break-system-packages neovim-remote')
end

-- Change leader to a comma
vim.g.mapleader = ','

-- When editing a file, always jump to the last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		if vim.g.leave_my_cursor_position_alone then
			return
		end

		local last_line = vim.fn.line([['"]])
		if last_line > 0 and last_line <= vim.fn.line("$") then
			vim.cmd.normal({ args = { [[g'"]] }, bang = true })
		end
	end,
})

require("config.lazy")
vim.cmd.colorscheme "jellybeans-nvim"
