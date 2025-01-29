local vim = vim
local opt = vim.opt

opt.compatible = false --enable neovim specific features

--search
opt.hlsearch = true --highlight search matches realtime
opt.incsearch = true --increment search realtim
opt.ignorecase = true --disable case search
opt.smartcase = true --use case sensitive if a case is used

--editor
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.number = true --enable line numbers
opt.background = "dark"
opt.showmatch = true --highlight pairs (ie. {},(),[]) when cursor is over them
opt.termguicolors = true
opt.cc = "110" --color column
opt.ttyfast = true -- smoother scrolling
opt.wrap = false

--mouse
opt.mouse = "v" --enable mouse usage
opt.mouse = "a"

--tabs
opt.tabstop = 4 --4 columns = 1 tab
opt.softtabstop = 4 --4 spaces = 1 tab
opt.shiftwidth = 4 --spaces sued for autoindent
opt.expandtab = true --tabs convert to spaces
opt.autoindent = true --main indentation across lines
opt.paste = false --disable auto-indentation

opt.wildmode = "longest,list"
opt.clipboard = "unnamedplus" --set clipboard to system clipboard

