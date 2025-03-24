# vim-config

主要面向c/c++的精简neovim配置，

blog中有对每个插件[更加详细一点的介绍](https://blog.whatsroot.xyz/2023/11/05/neovim-and-plugin/)

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
- nvim-lualine/lualine.nvim: 用于显示各种状态，比如插入模式，编辑模式等

### 安装依赖：

neovim 0.9+
xsel(可选)

### 安装

```
git clone https://github.com/leeyeel/vim-config.git ~/.config/nvim
```
安装完成后使用`nvim`启动，nvim会自动安装所需插件

如果需要自己添加插件，可在`lua/plugin.lua`文件中，
`require("lazy").setup()`后追加一行自己的插件即可，注意要版本兼容。

### 主要快捷键

- alt + m: 打开或关闭文件浏览
- alt + l: 打开或关闭大纲浏览
- ctl + h: 查看上一个标签
- ctl + l: 查看下一个标签
- ctl + n: 补全时选中下个候选
- ctl + n: 补全时选中上个候选

### Lsp 使用技巧

- lsp server安装

使用`:LspInstall xxx` 命令即可

- compile_commands.json 文件生成

lsp的跳转依赖compile_commands.json, 
在CMake及Make工具链下生成compile_commands.json略有不同，CMake下生成可通过添加

```
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

选项开启, Make工具链下可在`make`前添加`bear`命令:
```
baer -- make
```
测bear生成效果更好，因为`bear`可以捕获真实的编译命令，所以通常 比`CMake`生成的`compile_commands.json`更完整。


