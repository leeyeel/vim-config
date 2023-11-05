# vim-config
neovim configure on ubuntu 22.04LTS

### 介绍

转向neovim.

vim的插件相对较少，甚至使用部分插件时已经不兼容vim8,而当我升级到vim9之后，
更多原来的插件报兼容性错误，vim9做了较多的改动，重新适应vim9不如直接。。。

但是neovim也有一大堆问题，最主要最主要的问题就是他现在更新太快，
插件也极其不稳定，半年之后现在用的一大堆插件可能就出现停更或者不兼容的问题。

但neovim的社区更活跃

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

### 安装依赖：

neovim 0.9+
xsel(可选)

### 安装

```
cp colors init.lua lua -rf ~/.config/nvim/
```
