-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                               -- Enable mouse support
opt.swapfile = false                          -- Don't use swapfile
opt.completeopt = 'menuone,noselect,fuzzy,popup' -- Built-in completion (nvim-cmp has its own)
opt.backup = false
opt.writebackup = false
opt.shell = 'zsh'
opt.mat = 2                      -- How many tenths of seconds ro blink
opt.fileformats = 'unix,mac,dos' -- Unix as standard file format
opt.viewoptions = 'folds,cursor,curdir,slash,unix'
opt.wildignorecase = true
opt.wildignore =
'.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store,**/node_modules/**,**/bower_modules/**'
opt.hlsearch = false -- No highlight search
opt.exrc = true
opt.signcolumn = 'yes' -- Always show the sign column

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.shiftwidth = 4     -- Shift 4 spaces when tab
opt.tabstop = 4        -- 1 tab == 4 spaces
opt.softtabstop = 4    -- 1 tab == 4 spaces
opt.expandtab = false  -- Use spaces instead of tabs
-- Indenting is left to filetype plugins / treesitter indentexpr.

-----------------------------------------------------------
-- Equal window sizes when resizing
-----------------------------------------------------------
-- Only on terminal resize: WinNew/WinClosed also fire for floating windows
-- (hover, completion docs, fzf) and would reset manually sized splits.
-- 'equalalways' already handles splitting/closing normal windows.
vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("user_equalize_windows", { clear = true }),
	callback = function()
		vim.cmd("wincmd =")
	end,
})
opt.equalalways = true
opt.eadirection = "both"

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.synmaxcol = 240   -- Max column for syntax highlight
opt.updatetime = 300  -- ms to wait for trigger an event
opt.timeoutlen = 500  -- ms to wait for a mapped sequence to complete.
opt.foldenable = false

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "csI"

-- Built-in plugins are disabled in lua/config/lazy.lua (performance.rtp).
