vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto Compile when there are changes in plugins.lua

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute "packadd packer.nvim"
end

return require('packer').startup(function (use)
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Aparencia
	use 'owozsh/amora'
	use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
	use { 'akinsho/nvim-bufferline.lua', requires = { 'kyazdani42/nvim-web-devicons'} }

	-- LSP
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'folke/lsp-colors.nvim'
    use 'folke/lsp-trouble.nvim'

	-- T-pope
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Compe
    use 'hrsh7th/nvim-compe'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Which Key
    use { 'AckslD/nvim-whichkey-setup.lua', requires = { 'liuchengxu/vim-which-key' } }

    -- Toggle Terminal
    use 'akinsho/nvim-toggleterm.lua'

    -- TODO Comments
    use { 'folke/todo-comments.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Nvim-tree
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

	-- Do vinicius oooooooownnnnnnn lindinho tiamu norminette
	use { 'vinicius507/norme.nvim', requires = { 'mfussenegger/nvim-lint' } }

	-- Header 42 do Edu
	use 'eduardomosko/header42.nvim'

end
)
