-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
	view = {
		entries = "custom",
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'nvim_lua' },
	},
}
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
require'cmp'.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' } -- cmp-buffer needed
	}
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
require'cmp'.setup.cmdline(':', {
	sources = {
		{ name = 'cmdline' },
		{ name = 'path' }, -- cmp-path needed
	}
})
