-- If neovim remote is not installed, install it
if vim.fn.executable('nvr') == 0 then
	vim.api.nvim_command('!pip3 install --user --break-system-packages neovim-remote')
end

-- Change leader to a comma
vim.g.mapleader = ','

local function get_hostname()
	local f = io.open("/etc/hostname")
	local hostname = f:read("*a") or ""
	f:close()
	hostname = string.gsub(hostname, "\n$", "")
	return hostname
end

-- Load plugins on devices other than RPi
if get_hostname() ~= "shoggoth" then
	-- Bootstrap lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out,                            "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
	vim.opt.rtp:prepend(lazypath)

	---@type LazySpec
	local plugins = 'plugins'

	-- Configure plugins.
	require('lazy').setup(plugins, {
		ui = { border = 'rounded' },
		dev = { path = vim.g.projects_dir },
		install = {
			-- Do not automatically install on startup.
			missing = false,
		},
		-- Don't bother me when tweaking plugins.
		change_detection = { notify = false },
		-- None of my plugins use luarocks so disable this.
		rocks = {
			enabled = false,
		},
		performance = {
			rtp = {
				-- Stuff I don't use.
				disabled_plugins = {
					'gzip',
					'netrwPlugin',
					'rplugin',
					'tarPlugin',
					'tohtml',
					'tutor',
					'zipPlugin',
				},
			},
		},
	})

	vim.cmd.colorscheme "jellybeans-nvim"
end
-- Load plugins on devices other than RPi
