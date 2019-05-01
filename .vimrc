set nocompatible

set history=500

filetype off

set autoread

let mapleader = ","

nmap <leader>w :w!<cr>

command W w !sudo tee % > /dev/null

syntax on

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme slate
catch
endtry

set background=dark

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR cterm=Bold ctermfg=LightBlue
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermfg=LightBlue
augroup END

set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

filetype plugin indent on

set so=7
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set wildmenu

set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=.git\*,.hg\*,.svn\*,*/.DS_Store
endif

set ruler

set cmdheight=2
set hid

set whichwrap+=<,>,h,l

set lazyredraw

set magic

set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

set foldcolumn=1

set modelines=0

set wrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set noshiftround

set scrolloff=5
set backspace=indent,eol,start

set ttyfast

set laststatus=2

set showmode
set showcmd

set matchpairs+=<:>

set list
set listchars=tab:>\ ,trail:•,extends:#,nbsp:.

set number relativenumber
set rnu

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set encoding=utf-8

set hlsearch
set incsearch
set ignorecase
set smartcase

set viminfo='100,<9999,s100

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

map <space> /
map <c-space> ?

map <silent> <leader><cr> :noh<cr>

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
