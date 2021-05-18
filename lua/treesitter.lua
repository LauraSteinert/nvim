require('nvim-treesitter.configs').setup {
	ensure_installed = {'c', 'lua', 'javascript', 'typescript', 'bash', 'python'},
	highlight = {
		enable = true,
	},
}
