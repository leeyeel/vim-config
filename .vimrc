set nocompatible 
filetype on

set background=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set nu
set ignorecase
set smartcase
set ts=4
set tags=./tags,tags;$HOME

set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

colorscheme molokai
syntax enable

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" indentation rules for FFmpeg: 4 spaces, no tabs
set cinoptions=(0
" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
" Trailing whitespace and tabs are forbidden, so highlight them.
highlight ForbiddenWhitespace ctermbg=red guibg=red
match ForbiddenWhitespace /\s\+$\|\t/
" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'yegappan/taglist'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

nnoremap gd :LspDefinition<cr>
nnoremap gn :LspNextDiagnostic<cr>
nnoremap gp :LspPreviousDiagnostic<cr>
nnoremap gr :LspReferences<cr>
nnoremap gR :LspRename<cr>
nnoremap gs :LspStopServer<cr>
nnoremap gp :LspPeekDefinition<cr>
nnoremap gc :LspCodeAction<cr>
nnoremap gh :LspHover<cr>


let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Auto_Open = 1
"let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50 

cs add cscope.out

" Automatic C / C++ file headers
" (relies on automatic creation of new stars on 'o' )
function! s:insert_header()
  let filename = expand("%:t")
  execute "normal! i /*!"
  execute "normal! o@file " .filename
  execute "normal! o@brief "
  execute "normal! o@author liyao"
  execute "normal! o@date ".strftime("%c")
  execute "normal! o/"
  normal! o
  normal! o
endfunction
autocmd BufNewFile *.{h,c,cpp} call <SID>insert_header()

" Automatic C / C++ header guards
function! s:insert_gates()
  let gatename = "__" . substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  normal! o
  execute "normal! Go#endif /* " . gatename . " */"
  normal! k
endfunction
autocmd BufNewFile *.{h} call <SID>insert_gates()

" Automatic header file inclusion (foo.c includes foo.h)
function! s:insert_header_incl()
  let filename = expand("%:t")
  execute "normal! i#include " . "\"" . substitute(filename, "\\.c", "\\.h", "g") . "\""
  normal! o
  execute "normal! o/********************** MACROS AND TYPE DEFINITIONS  **********************/" 
  normal! o
  execute "normal! o/******************** STRUCT AND GLOBAL DEFINITIONS  **********************/"
  normal! o
  execute "normal! o/************************ FUNCTION DEFINITIONS ***************************/"
endfunction
autocmd BufNewFile *.{c,cpp} call <SID>insert_header_incl()
