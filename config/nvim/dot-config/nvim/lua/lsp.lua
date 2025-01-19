local lsps = {
   'pylsp',
    'lua_ls',
    'rust_analyzer',
    'bashls',
    'clangd',
    'neocmake',
    'ast_grep',
    'dockerls',
    'harper_ls'
}

require('mason').setup()
require('mason-lspconfig').setup({
    --a list of servers to automatically install if they're not already installed
    ensure_installed = lsps
})

local vim = vim

--setup each lsp
for i = 1, #lsps do
    local lsp = lsps[i]
    require("lspconfig")[lsp].setup{}
end
