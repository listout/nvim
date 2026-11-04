return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		event = 'VeryLazy',
		-- Only options that differ from lualine's defaults.
		opts = {
			options = {
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_c = {
					{ 'filename', path = 1 }, -- relative path
				},
			},
		},
	},
}
