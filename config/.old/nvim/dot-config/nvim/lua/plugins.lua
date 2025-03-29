local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter')
Plug('gruvbox-community/gruvbox')
Plug('scrooloose/nerdtree')
Plug('honza/vim-snippets')
Plug('ryanoasis/vim-devicons')
Plug('nvim-lualine/lualine.nvim')

--todo-comments
Plug('nvim-lua/plenary.nvim')
Plug('folke/todo-comments.nvim')

--mason
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")

--render-markdown
Plug("MeanderingProgrammer/render-markdown.nvim")

--nvim-cmp
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

vim.call('plug#end')
