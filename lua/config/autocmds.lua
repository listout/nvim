local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.hl.hl_op()
	end,
})

-- Highlight on put
vim.api.nvim_create_autocmd("TextPutPost", {
	group = augroup("highlight_put"),
	callback = function()
		vim.hl.hl_op()
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"diff",
		"git",
		"fugitive",
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)
		if vim.g.leave_my_cursor_position_alone then
			return
		end
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc_restored then
			return
		end
		vim.b[buf].last_loc_restored = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd({ "ColorScheme", "BufReadPost" }, {
	pattern = { "*patch.diff" },
	callback = function()
		vim.api.nvim_set_hl(0, "PRDiffAdd", { fg = "#232634", bg = "#a6da95" })
		vim.api.nvim_set_hl(0, "PRDiffDel", { fg = "#d7e3d8", bg = "#e82424" })
		vim.cmd.syntax([[match PRDiffAdd /\v^[\+]((\-\-)|(\@\@ )|(\+\+)|(index )|(diff ))@!.*/]])
		vim.cmd.syntax([[match PRDiffDel /\v^[\-]((\-\-)|(\@\@ )|(\+\+)|(index )|(diff ))@!.*/]])
	end,
})
