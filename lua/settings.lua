local GLOBAL = vim.o
local BUFFER = vim.bo
local WINDOW = vim.wo
local options = {}

local set_options = function(locality, opt)
	for key, value in pairs(opt) do
		locality[key] = value
	end
end

local set_globals = function(opt)
	for _, value in pairs(opt) do
		for key, val in pairs(value) do
			GLOBAL[key] = val
		end
	end
end

options['buffer'] = {
	shiftwidth = 4,
	tabstop = 4,
}

options['window'] = {
	number = true,
	cursorline = true,
}

options['global'] = {
	showmode = false,
	hidden = true,
	hlsearch = false,
	shortmess = "filnxToOFc",
	splitright = true,
}

set_globals(options)
set_options(BUFFER, options['buffer'])
set_options(WINDOW, options['window'])
-- Norme.nvim options
vim.cmd "autocmd BufEnter,BufRead *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd BufWritePost *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd InsertLeave *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd TextChanged *.c,*.h lua require('norme').lint()"
