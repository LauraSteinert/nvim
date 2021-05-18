require('lualine').setup{
	options = {
		theme = 'auto',
		section_separators = {'', ''},
		component_separators = {'', ''},
		disabled_filetypes = {},
		icons_enabled = true,
	},
	sections = {
		lualine_a = { {'mode', upper = true} },
		lualine_b = {
			{
				'filename',
				file_status = false,
			},
			{
				'diagnostics',
				sources = { 'nvim_lsp' },
				sections = { 'error', 'warn', 'info' },
				symbols = {error = ' ', warn = ' ', info= ' '},
			},
		},
		lualine_c = {
		},
		lualine_x = {  },
		lualine_y = {
			{
				'branch',
				icon = ''
			},
			'filetype',
		},
		lualine_z = { 'progress' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {}
}
