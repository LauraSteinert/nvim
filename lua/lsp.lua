local lspinstall = require('lspinstall')
local lspconfig = require('lspconfig')

local config = {
	clangd = {
		cmd = {
			'clangd',
			'--background-index',
			'--suggest-missing-includes'
		},
	},
	lua = {
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
					path = vim.split(package.path, ';'),
				},
				diagnostics = {
					globals = {'vim'},
				},
				workspace = {
					library = {
						[vim.fn.expand('$VIMRUNTIME/lua')] = true,
						[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
					},
				},
			}
		}
	},
}

local function setup_servers()
	lspinstall.setup()
	local servers = lspinstall.installed_servers()
	for _, server in pairs(servers) do
		lspconfig[server].setup(config[server] or {})
	end
end

setup_servers()

lspinstall.post_install_hook = function ()
	setup_servers()
	vim.cmd("bufdo e")
end
