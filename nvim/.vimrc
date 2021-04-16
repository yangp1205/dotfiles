" 基础配置
syntax on
set encoding=utf-8
set nu
set rnu
set ruler
set backspace=2
set nocompatible
set confirm
autocmd InsertEnter * se cuc
set cul

" 自动缩进和Tabs设置
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set ai!
set smartindent

" 基于缩进进行代码折叠
set foldmethod=manual
" 启动 Vim 时关闭折叠
set nofoldenable

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 符号自动匹配
set showmatch

" 搜索自动匹配
set incsearch


filetype plugin on

"F5运行python3
map <F5> :call RunPython()<CR>
func! RunPython()
    exec "W"
    if &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

map <C-r> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "cd %:p:h"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc




" shell、python头文件

autocmd BufNewFile *.py,*.sh exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
        let filetype_name = strpart(expand("%"), stridx(expand("%"), "."))
        if filetype_name == '.sh'
                call setline(1,"\#!/bin/bash")
                call append(line("."), "\# File Name: ".expand("%"))
                call append(line(".")+1, "\# Author: yangp")
                call append(line(".")+2, "\# mail: yangp1997@gmail.com")
                call append(line(".")+3, "\# Created Time: ".strftime("%c"))
                call append(line(".")+4, "")
        elseif filetype_name == '.py'
                call setline(1,"#!/usr/bin/python3")
                call append(line("."), "# -*- coding:utf-8 -*-")
                call append(line(".")+1, "\# File Name: ".expand("%"))
                call append(line(".")+2, "\# Author: yangp")
                call append(line(".")+3, "\# Mail: yangp1997@gmail.com ")
                call append(line(".")+4, "\# Created Time: ".strftime("%c"))
                call append(line(".")+6,"")
        else
                call setline(1, "/*************************************************************************")
                call append(line("."), " File Name: ".expand("%"))
                call append(line(".")+1, "Author: yangp")
                call append(line(".")+2, " Mail: yangp1997@gmail.com ")
                call append(line(".")+3, " Created Time: ".strftime("%c"))
                call append(line(".")+5, "")
        endif
                "新建文件后，自动定位到文件末尾
endfunc
    autocmd BufNewFile * normal G


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

Plug 'airblade/vim-gitgutter'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'Raimondi/delimitMate'

"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"let g:mkdp_browser = "/usr/bin/chromium"
"let g:mkdp_markdown_css=''
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-vimlsp', 'coc-json', 'coc-python']
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Initialize plugin system
call plug#end()

