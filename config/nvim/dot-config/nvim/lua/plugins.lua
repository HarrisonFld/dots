local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter')
Plug('gruvbox-community/gruvbox')
Plug('scrooloose/nerdtree')
Plug('honza/vim-snippets')
Plug('ryanoasis/vim-devicons')
Plug('nvim-lualine/lualine.nvim')

Plug('nvim-lua/plenary.nvim')
Plug('folke/todo-comments.nvim')

Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")

Plug("MeanderingProgrammer/render-markdown.nvim")

vim.call('plug#end')
