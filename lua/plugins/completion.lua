return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp"
	},
	{ "rafamadriz/friendly-snippets" },
	{
		"petertriho/cmp-git",
		dependencies = "nvim-lua/plenary.nvim"
	},
	{ "micangl/cmp-vimtex" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local has_words_before = function()
				local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and
					vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			-- luasnip setup
			local luasnip = require 'luasnip'

			local cmp_kinds = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			}

			-- nvim-cmp setup
			local cmp = require 'cmp'
			cmp.setup {
				view = {
					docs = {
						auto_open = false
					},
				},
				formatting = {
					fields = { "kind", "abbr" },
					format = function(_, vim_item)
						vim_item.kind = cmp_kinds[vim_item.kind] or ""
						return vim_item
					end,
				},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
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
					{ name = 'luasnip',                option = { show_autosnippets = true } },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'path' },
					{ name = 'buffer' },
					{ name = 'nvim_lua' },
					{ name = 'vimtex' },
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
			require 'cmp'.setup.cmdline('/', {
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
				})
			})

			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)

			-- lazy loading to get in memory snippets of languages you use
			require("luasnip/loaders/from_vscode").lazy_load()

			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = false,
				update_in_insert = true,
				severity_sort = false,
				float = {
					source = true,
				},
			})
		end,
	},
}
