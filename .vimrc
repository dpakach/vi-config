" VUNDLE settings

set nocompatible
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()



" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'scrooloose/syntastic'
Bundle 'valloric/youcompleteme'
Plugin 'Yggdroot/indentLine'
Plugin 'digitaltoad/vim-pug'
Plugin 'alvan/vim-closetag'
Plugin 'vim-scripts/django.vim'
Plugin 'tweekmonster/django-plus.vim'
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'sukima/xmledit'
Plugin 'vim-scripts/pydoc.vim'
Plugin 'vim-scripts/indentpython.vim'

Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'morhetz/gruvbox'
Plugin 'prettier/vim-prettier'




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"   seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"   let g:seoul256_background = 233
"   colo seoul256


" general settings

setlocal spell spelllang=en_us
" set mouse=a


set noswapfile

syntax enable                   " enable syntax processing

set tabstop=4               " number of visual spaces per TAB

set shiftwidth=4            " indenting 2 spaces

set softtabstop=4           " number of spaces in tab when editing

set expandtab               " tabs are spaces

set showcmd                     " show command in bottom bar

set cursorline                  " highlight current line

set number                      " show line numbers

filetype indent on              " load filetype-specific indent files

set wildmenu                    " visual autocomplete for command menu

set showmatch                   " highlight matching [{()}]

set incsearch                   " search as characters are entered
set hlsearch            " highlight matches

nnoremap <leader><space> :nohlsearch<CR>

set foldenable          " enable folding

set foldlevelstart=10   " open most folds by default

set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za

set foldmethod=indent   " fold based on indent level

nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>
inoremap JK <esc>

" hybrid line numbers
:set number relativenumber

" move between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" auto complete html tags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags


" gruvbox settings
colo gruvbox
set background=dark
let g:gruvbox_invert_selection=0
" let g:gruvbox_invert_selection=1


" badwolf setting




" nerdtree setting

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <leader>t :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1            " auto close nerdtree when new tab is opened



" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = '/usr/bin/python'



" UlstiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"




" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
" found somewhere on stackoverflow ((super useful))
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction



set clipboard=unnamed

"toggle for paste and nopaste mode
"
set pastetoggle=<F2>

" move current line or block of codes with alt+movement keys
" ((super useful))
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" emmet settings
"   map for trigger
let g:user_emmet_leader_key = '<C-Z>'


" ctrlp settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" prettier settings
let g:prettier#config#tab_width = 4
