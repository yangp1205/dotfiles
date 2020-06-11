" 基础配置
syntax on
set encoding=utf-8
set nu
set ruler
set backspace=2
" set nocompatible
set confirm
autocmd InsertEnter * set cursorcolumn
set cursorline

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
let g:python3_host_prog = '/usr/local/bin/python3'

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


"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数"
"let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径"
"let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询"
"let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口"



" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Plug 'Valloric/YouCompleteMe'
"let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数"
"let g:ycm_python_binary_path = "/usr/local/bin/python3" "jedi模块所在python解释器路径"
"let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询"
"let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口"

Plug 'mhinz/vim-startify'

Plug 'airblade/vim-gitgutter'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tell-k/vim-autopep8'
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

Plug 'vim-airline/vim-airline'
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>


Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
" <leader>1~9 切到 buffer1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

Plug 'Raimondi/delimitMate'

"Plug 'maralla/completor.vim'
"let g:completor_python_binary = '/usr/bin/python3'

Plug 'vim-syntastic/syntastic'

Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0

Plug 'frazrepo/vim-rainbow'
au FileType c,cpp,objc,objcpp,py call rainbow#load()
let g:rainbow_active = 1

Plug 'SirVer/ultisnips'
" 网友贡献的补全片段
Plug 'honza/vim-snippets'
"let g:UltiSnipsExpandTrigger       = "<c-tab>"     " 代码片段补全触发
"let g:UltiSnipsListSnippets        = "<c-\>"       " 列出补全可选列表
"let g:UltiSnipsJumpForwardTrigger  = "<c-j>"       " 下一条补全
"let g:UltiSnipsJumpBackwardTrigger = "<c-k>"       " 上一条补全
"let g:UltiSnipsEditSplit           = "horizontal"  " how the edit window is opened

Plug 'preservim/nerdcommenter'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
let g:mkdp_browser = "/Applications/Google Chrome.app"
let g:mkdp_markdown_css=''

" Initialize plugin system
call plug#end()
