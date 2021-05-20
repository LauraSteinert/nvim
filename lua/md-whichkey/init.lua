local wk =  require('which-key')

wk.setup{
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		["<Tab>"] = "TAB"
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local keymap = {
	['1'] = 'which_key_ignore',
	['2'] = 'which_key_ignore',
	['3'] = 'which_key_ignore',
	['4'] = 'which_key_ignore',
	['5'] = 'which_key_ignore',
	['6'] = 'which_key_ignore',
	['7'] = 'which_key_ignore',
	['8'] = 'which_key_ignore',
	['9'] = 'which_key_ignore',
	['<Tab>'] = { '<cmd>NvimTreeToggle<CR>', 'Nvim-tree' },
	f = {
		name = '+find',
		f = {"<cmd>lua require('telescope.builtin').find_files()<CR>", 'files'},
		g = {"<cmd>lua require('telescope.builtin').live_grep()<CR>", 'grep'},
		h = {"<cmd>lua require('telescope.builtin').help_tags()<CR>", 'help tags'},
		G = {
			name = '+git',
			g = {"<cmd>lua require('telescope.builtin').git_commits()<CR>", 'commits'},
			c = {"<cmd>lua require('telescope.builtin').git_bcommits()<CR>", 'bcommits'},
			b = {"<cmd>lua require('telescope.builtin').git_branches()<CR>", 'branches'},
			s = {"<cmd>lua require('telescope.builtin').git_status()<CR>", 'status'},
		},
	},
	g = {
		name = '+lsp',
		d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'definition' },
		D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration' },
		h = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
		i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation' },
		r = { '<cmd>LspTrouble lsp_references<cr>', 'references' },
		s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature help' },
	},
	n = {
		name = '+nvim-tree',
		r = { '<cmd>NvimTreeRefresh<CR>', 'refresh' },
		f = { '<cmd>NvimTreeFindFile<CR>', 'find' },
	},
	q = { '<cmd>bdelete!<CR>', 'kill buffer' },
	t = { '<cmd>TodoTrouble<CR>', 'todo' },
	x = {
		name = '+trouble',
		d = { '<cmd>LspTroubleToggle lsp_document_diagnostics<CR>', 'document' },
		l = { '<cmd>LspTroubleToggle loclist<CR>', 'loclist' },
		q = { '<cmd>LspTroubleToggle quickfix<CR>', 'quickfix' },
		w = { '<cmd>LspTroubleToggle lsp_workspace_diagnostics<CR>', 'worskpace' },
		x = { '<cmd>LspTroubleToggle<CR>', 'toggle' },
	},
}
wk.register(keymap, {prefix = '<leader>'})
