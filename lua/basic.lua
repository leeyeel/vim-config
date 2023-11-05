vim.o.nocompatible = true
vim.o.filetype = true
vim.o.background="dark"
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.termguicolors = true
vim.o.mouse = ""
vim.o.hidden = true
vim.o.title = true
vim.o.conceallevel = 1
vim.o.undofile = true
vim.o.cursorline = true
vim.o.pumblend = 12
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.number = true
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.linebreak = true
vim.o.signcolumn = "yes"
vim.o.textwidth = 120
vim.o.wrap = false
vim.o.showbreak = ">>"
vim.o.fillchars = "diff:╱"
vim.o.scrolloff = 2
vim.o.sidescrolloff = 5
vim.g.mapleader = " "
vim.o.updatetime = 300
vim.o.timeoutlen = 400
vim.g.directory = "/tmp//"

--[==[
vim.o.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.cmd[[
        silent !xsel -bi
        silent !xsel -bo | xsel -bi
        ]]
    end
})
--]==]

