local vimg = vim.g

local config = {
	side = 'left',
	width = 30,
	ignore = { '.git', 'node_modules', '.cache' },
	gitignore = 1,
	auto_open = 0,
	auto_close = 0,
	auto_ignore_ft = {},
	quit_on_open = 1,
	follow = 1,
	indent_markers = 0,
	hide_dotfiles = 0,
	git_hl = 0,
	root_folder_modifier = ':t',
	tab_open = 0,
	width_allow_resize = 0,
	disable_netrw = 1,
	hijack_netrw = 1,
	add_trailing = 0,
	group_empty = 1,
	lsp_diagnostics = 1,
	special_files = { 'README.md', 'Makefile' },
	show_icons = { git = 0, folders = 1, files = 1 },
	icons = {
		default = '',
		symlink= '',
		git = {
			unstaged = '✗',
			staged = '✓',
			unmerged = '',
			renamed = '➜',
			untracked = '★',
			deleted = '',
			ignored = '◌'
		},
		folder = {
			default = '',
			open = '',
			empty = '',
			empty_open = '',
			symlink = '',
			symlink_open = '',
		},
		lsp = {
			hint = '',
			info = '',
			warning = '',
			error = '',
		}
	}
}

local set_options = function(cfg)
	for key,value in pairs(cfg) do
		vimg['nvim_tree_' .. key] = value
	end
end

set_options(config)
