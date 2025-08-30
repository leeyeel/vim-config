vim.g.mapleader = " "

vim.opt.background="dark"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.mouse = ""
vim.opt.hidden = true
vim.opt.title = true
vim.opt.conceallevel = 1
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.pumblend = 12
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.linebreak = true
vim.opt.signcolumn = "yes"
vim.opt.textwidth = 120
vim.opt.wrap = false
vim.opt.showbreak = ">>"
vim.opt.fillchars = "diff:╱"
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400
vim.opt.directory = "/tmp//"

vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        if vim.fn.has('unix') == 1 then
            if vim.fn.has('linux') == 1 then
                vim.cmd[[
                silent !xsel -bi
                silent !xsel -bo | xsel -bi
                ]]
            elseif vim.fn.has('mac') == 1 then
                vim.cmd[[
                silent !pbcopy < %:p
                ]]
            end
        end
    end
})

