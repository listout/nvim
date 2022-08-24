local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.relativenumber = true   -- Show relative line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = false   -- Enable 24-bit RGB colors
opt.laststatus = 2          -- Set global statusline
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
opt.listchars = 'tab:▸ ,extends:›,precedes:‹,nbsp:·,trail:·'
opt.background = 'dark'
opt.cmdheight = 2
opt.fillchars = {
	diff = "╱",
	vert = "│",
	fold = "⠀",
	eob = " ", -- suppress ~ at EndOfBuffer
	--diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

vim.cmd [[
	" Function, identifier and comments in italic
	highlight Function cterm=italic gui=italic
	highlight Indentifier cterm=none gui=italic
	highlight Comment cterm=italic gui=italic
]]

