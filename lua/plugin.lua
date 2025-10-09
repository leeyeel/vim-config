-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup({
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-web-devicons",
  "stevearc/aerial.nvim",
  "nvim-tree/nvim-tree.lua",
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true, auto_trigger = true },
        panel = { enabled = true },
      })
    end,
  }
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
    "clangd",
    "pyright",
    "gopls",
    "vtsls",
  },
  automatic_installation = true,
})

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline({ "/", "?" }, {
  sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

-- LSP capabilities from cmp
local capabilities = (function()
  local ok, cmp_caps = pcall(require, "cmp_nvim_lsp")
  if ok then
    return cmp_caps.default_capabilities()
  else
    return vim.lsp.protocol.make_client_capabilities()
  end
end)()

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } },
  },
})

vim.lsp.config("bashls", {
  capabilities = capabilities,
})

vim.lsp.config("clangd", {
  capabilities = capabilities,
  cmd = {
    "clangd",
    -- "--header-insertion=never",
    -- "--completion-style=detailed",
  },
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
})

vim.lsp.config("gopls", {
  capabilities = capabilities,
})

vim.lsp.config("vtsls", {
  capabilities = capabilities,
})

vim.lsp.enable({ "lua_ls", "bashls", "clangd", "pyright", "gopls", "vtsls" })

require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp", "lua", "vim", "python", "go", "javascript" },
})

require("aerial").setup({
  open_automatic = true,
})

require("nvim-tree").setup()

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
})

require("lualine").setup()
