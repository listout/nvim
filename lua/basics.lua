-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)
local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.history = 500                     -- Lines vim should remember
opt.backup = false
opt.writebackup = false
opt.shell = 'zsh'
opt.magic = true                      -- Vim's regular expression magic
opt.mat = 2                           -- How many tenths of seconds ro blink
opt.fileformats = 'unix,mac,dos'      -- Unix as standard file format
opt.encoding = 'utf-8'                -- Encoding
opt.viewoptions = 'folds,cursor,curdir,slash,unix'
opt.wildignorecase = true
opt.wildignore = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store,**/node_modules/**,**/bower_modules/**'
opt.hlsearch = false        -- No highlight search
opt.incsearch = true
opt.ignorecase = true
opt.backspace = 'indent,eol,start'
opt.exrc = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.softtabstop = 4         -- 1 tab == 4 spaces
opt.expandtab = false       -- Use spaces instead of tabs
opt.smartindent = true      -- Autoindent new lines
opt.autoindent = true       -- Copy indent from current line when starting new line
opt.cindent = true          -- C programming indentation

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 300        -- ms to wait for trigger an event
opt.timeoutlen = 500        -- ms to wait for a mapped sequence to complete.
opt.foldenable = false

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "csI"

-- -- Disable builtin plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end
