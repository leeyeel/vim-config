local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
-- LSP
-- rename
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
map("n", "<leader>r", ":LspRestart<CR>", opt)
-- go xx
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
-- diagnostic
map("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)

map("n", "<F5>", ":T clang++ -O2 -std=c++17 -fsanitize=address -DLOCAL -I/Users/syh/solution/header/ %:p -o %:p:r && %:p:r<CR>", opt)
map("n", "<F6>", ":T clang++ -O2 -std=c++17 -fsanitize=address -DLOCAL -I/Users/syh/solution/header/ %:p -o %:p:r && %:p:r < %:p:h/in <CR>", opt)

local pluginKeys = {}

pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

return pluginKeys
