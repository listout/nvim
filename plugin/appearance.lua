local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true         -- Show line number
opt.relativenumber = true -- Show relative line number
opt.showmatch = true      -- Highlight matching parenthesis
opt.foldmethod = 'marker' -- Enable folding (default 'foldmarker')
opt.splitright = true     -- Vertical split to the right
opt.splitbelow = true     -- Horizontal split to the bottom
opt.ignorecase = true     -- Ignore case letters when search
opt.smartcase = true      -- Ignore lowercase for the whole pattern
opt.linebreak = true      -- Wrap on word boundary
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.laststatus = 2        -- Set global statusline
opt.colorcolumn = "120"   -- Set global color column
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.foldlevelstart = 99
opt.ruler = false
opt.list = true
opt.showtabline = 0
opt.winwidth = 30
opt.winminwidth = 10
opt.pumheight = 15
opt.helpheight = 12
opt.previewheight = 12
opt.showcmd = false
opt.listchars = 'tab:░ ,extends:›,precedes:‹,nbsp:·,trail:·'
opt.background = 'dark'
opt.cmdheight = 0 -- ui2 shows messages in a floating window instead
opt.fillchars = {
	diff = "╱", -- alternatives = ⣿ ░ ─ ╱
	vert = "│",
	fold = "⠀",
	eob = " ", -- suppress ~ at EndOfBuffer
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}
opt.winborder = "rounded" -- Defines the default border style of floating windows

-- Function, identifier and comments in italic.
-- Re-applied on every :colorscheme, since colorschemes reset highlights.
local function italic_overrides()
	vim.cmd [[
		highlight Function cterm=italic gui=italic
		highlight Identifier cterm=none gui=italic
		highlight Comment cterm=italic gui=italic
	]]
end
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("user_italic_overrides", { clear = true }),
	callback = italic_overrides,
})
italic_overrides()
