require("toggleterm").setup{
	size = 15,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = '1',
	start_in_insert = true,
	persist_size = true,
	direction = 'horizontal',
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = 'single',
		width = 1280,
		height = 720,
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		}
	}
}

