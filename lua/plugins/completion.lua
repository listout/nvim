return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		lazy = true,
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			{ "petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim" },
			"micangl/cmp-vimtex",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"windwp/nvim-autopairs",
		},
		config = function()
			-- luasnip setup
			local luasnip = require 'luasnip'

			-- nvim-cmp setup
			local cmp = require 'cmp'
			local lspkind = require('lspkind')

			cmp.setup {
				formatting = {
					fields = { 'abbr', 'icon', 'kind', 'menu' },
					format = lspkind.cmp_format({
						maxwidth = {
							-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
							-- can also be a function to dynamically calculate max width such as
							-- menu = function() return math.floor(0.45 * vim.o.columns) end,
							menu = 70, -- leading text (labelDetails)
							abbr = 70, -- actual suggestion item
						},
						ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					})
				},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered({ border = 'single' }),
					documentation = cmp.config.window.bordered({ border = 'single' }),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = 'lazydev', group_index = 0 }, -- Neovim Lua API (lua files only)
					{ name = 'nvim_lsp' },
					{ name = 'vimtex' },
					{ name = 'nvim_lsp_signature_help' },
					{
						name = 'luasnip',
						option =
						{
							use_show_condition = false,
							show_autosnippets = true,
						}
					},
					{ name = 'buffer' },
					{ name = 'path' },
				}),
			}

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = 'buffer' },
				}),
			})
			require("cmp_git").setup()

			-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline('/', {
				completion = { autocomplete = false },
				sources = {
					-- { name = 'buffer' }
					{ name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})

			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)

			-- lazy loading to get in memory snippets of languages you use
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
