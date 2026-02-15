if vim.env.SSH_CONNECTION then
	local osc52 = require("vim.ui.clipboard.osc52")

	vim.g.clipboard = {
		name = "osc52",
		copy = {
			["+"] = osc52.copy("+"),
			["*"] = osc52.copy("*"),
		},
		paste = {
			["+"] = osc52.paste("+"),
			["*"] = osc52.paste("*"),
		},
	}
else
	vim.opt.clipboard = "unnamedplus"
end
