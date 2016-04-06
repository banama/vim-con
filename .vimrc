" autoload _vimrc
autocmd! bufwritepost $HOME/.vimrc source %
set shortmess=atI
set encoding=utf-8

set autoread                 " 自动载入
set nu
set ruler                    " 显示标尺
set cursorline               " 突出显示当前行
set cursorcolumn
set magic

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=2
set autoindent
set smartindent
set cindent

"- 则点击光标不会换,用于复制
set mouse=a

" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell         " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

" 显示中文帮助
if version >= 603
    set helplang=cn
        set encoding=utf-8
        endif

" 修改leader键
let mapleader=","
let g:mapleader=","

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>; <Esc>:


" 代码折叠自定义快捷键 <leader>zz
set fdm=marker
let g:FoldMethod = 0
map <leader>zz :call FoldToggleFold()<cr>
map cz zO
map cZ zO
fun! FoldToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif


"检测文件类型
filetype on
""针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
""启动自动补全
filetype plugin indent on

"""" syntax high light
au BufRead,BufNewFile *.vue set filetype=html
au BufRead,BufNewFile *.es6 set filetype=java
au BufRead,BufNewFile *.ts set filetype=java

let g:syntastic_javascript_checkers = ['eslint']
