syntax enable
syntax on
set ruler
set tabstop=4
set autochdir
set autoindent
set showmatch 
set smartindent 
set matchtime 
set wildmenu
set background=dark
if (has("termguicolors"))
    set termguicolors
endif
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:airline_theme='oceanicnext'
colorscheme one
"允许使用鼠标定位
set mouse=a

"允许区域选择
set selection=exclusive
set selectmode=mouse,key

let Tlist_Show_One_File=1
let Tlist_Show_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr> 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
call vundle#end()

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd        " Show (partial) command in status line.
"set showmatch      " Show matching brackets.
"set ignorecase     " Do case insensitive matching
"set smartcase      " Do smart case matching
"代码`"set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set fileencodings=utf-8
set termencoding=utf-8

" 解决和tmux的颜色冲突问题
""colorscheme pablo

set rnu
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
inoremap <TAB> <c-r>=SkipPair()<CR>
nmap <F5> :!python3 %<CR>

nmap <F2> :!ici <C-R><C-W><CR>      " 翻译当前光标下的单词


" 自动补全括号
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

" 自动补全引号
function QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        return a:char
    elseif line[col - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<Esc>i"
    endif
endf

" 按 Tab 跳出括号和引号
function SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'"
        return "\<ESC>la"
    else
        return "\t"
    endif
endf

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on
" Below here to add the vundle what I want

" Emmet html标签快速生成
Plugin 'mattn/emmet-vim'
let g:user_emmet_mode = 'i'
let g:user_emmet_expandabbr_key = '<C-b>'
let g:user_emmet_next_key = '<C-d>'
let g:user_emmet_prev_key = '<C-t>'
let g:user_emmet_install_global = 1

" autocmd Filetype html,css,php,tpl,python,javascript,ruby EmmetInstall
let g:user_emmet_settings = {
            \ 'php' : {
            \ 'extends' : 'html',
            \ 'filters' : 'c',
            \ },
            \ 'xml' : {
            \ 'extends' : 'html',
            \ },
            \ 'haml' : {
            \ 'extends' : 'html',
            \ },
            \}

" NERDTree目录树插件
Plugin 'scrooloose/nerdtree'
nmap <F4> :NERDTree  <CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=20
let g:NERDTreeShowLineNumbers=1

" NERDCommenter快速注释插件
Plugin 'scrooloose/nerdcommenter'

" 变量函数树
" Plugin 'vim-scripts/taglist.vim'

" 快速添加符号
Plugin 'tpope/vim-surround'
" 使surround可重复
Plugin 'tpope/vim-repeat'

" 多行光标
Plugin 'terryma/vim-multiple-cursors'

" JS
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'pangloss/vim-javascript'

" Rails
Plugin 'tpope/vim-rails'

" 代码对齐
Plugin 'godlygeek/tabular'

" YouCompleteMe补全
Plugin 'Valloric/YouCompleteMe'

" YouCompleteMe补全配置
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf'
" 修改ycm按键
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 配置成像一样IDE
set completeopt=longest,menu
" 退出insert模式后自动隐藏补全提示框
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车键选择补全项
inoremap <expr> <CR>  pumvisible() ? "\<C-y>\<C-o>:pclose\<CR>\<C-o>l" : "\<CR>"
" 禁用补全
nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" 重命名文件
Plugin 'danro/rename.vim'

" 语法检查
" Plugin 'vim-syntastic/syntastic'

" Ctrlp 文件模糊查找
Plugin 'ctrlpvim/ctrlp.vim'
