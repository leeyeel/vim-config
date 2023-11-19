# vim-config

主要面向c/c++的精简neovim配置

### 介绍

配色:
molokai

插件管理:lazy.nvim
使用插件:
- nvim-lspconfig: lsp server配置工具
- mason:lsp server 管理工具
- mason-lspconfig: lspconfig与lsp server之间的桥接工具
- 补全相关:
    - "hrsh7th/cmp-nvim-lsp",    
    - "hrsh7th/cmp-buffer",    
    - "hrsh7th/cmp-path",    
    - "hrsh7th/cmp-cmdline",    
    - "hrsh7th/nvim-cmp",
    - "hrsh7th/cmp-vsnip",
    - "hrsh7th/vim-vsnip"
- nvim-treesitter/nvim-treesitter: 基于lsp的高亮显示
- nvim-tree/nvim-web-devicons: 各种特殊字符
- stevearc/aerial.nvim: 用于显示文件内符号大纲
- nvim-tree/nvim-tree.lua: 用于显示文件列表,文件浏览
- akinsho/bufferline.nvim: 用于在插件内跳转打开新文件时，把新文件当作新标签

### 安装依赖：

neovim 0.9+
xsel(可选)

### 安装

```
cp colors init.lua lua -rf ~/.config/nvim/
```

### 主要快捷键

- alt + m: 打开或关闭文件浏览
- alt + l: 打开或关闭大纲浏览
- ctl + h: 查看上一个标签
- ctl + l: 查看下一个标签
