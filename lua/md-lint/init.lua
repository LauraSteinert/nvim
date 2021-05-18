local lint = require('lint')
local norme = require('norme').linter

lint.linters.norme = norme

require('lint').linters_by_ft = {
	c = { 'norme', },
	cpp = { 'norme', }, -- for header and C++ files
}
