set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" This is my list of plugins:
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
"Color Scheme
Plugin 'Solarized'
"Plugin 'BusyBee'
"Color Scheme
Plugin 'Mustang2'
Plugin 'TagHighlight'
"Color Scheme
Plugin 'bandit.vim'
"Plugin 'molokai'
"Plugin 'tir_black'
"Plugin 'jellybeans.vim'
"Plugin 'wombat256.vim'
"Plugin 'Railscasts-Theme-GUIand256color'
"Plugin 'yearofmoo/Vim-Darkmate'
"Full path fuzzy file, buffer, mru, tag, ... finder
Plugin 'ctrlp.vim'
"Plugin 'darktango.vim'
"Plugin 'tangoshady'
"Plugin 'tango-desert.vim'
"Plugin 'seoul'
"Plugin 'Gentooish'
"Plugin 'darkZ'
"Plugin 'DarkZen-Color-Scheme'
"Plugin 'Distinguished'
"Plugin 'badwolf'
"Plugin 'edkolev/tmuxline.vim'
"Automatically adjust shiftwidth and expand tab based on current file
Plugin 'tpope/vim-sleuth'
"Go plugins
Plugin 'fatih/vim-go'
"Rust plugins
Plugin 'wting/rust.vim'
"Plugin 'delimitMate.vim'
"Auto close quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'
"Shows git diff in the sign column
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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


"""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme             = 'kolor'
"let g:airline_enable_branch     = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_enable_syntastic  = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

" unicode symbols
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.branch = '⎇'

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
"let delimitMate_jump_expansion = 1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" End of Plugins configuration
""""""""""""""""""""""""""""""

" Enable 256 colors
set t_Co=256
"set term=screen-256color

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
set background=dark
"let g:solarized_termcolors=256
"g:solarized_contrast high
colorscheme custom_Mustang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
"set shiftwidth=4
"set tabstop=8

" Linebreak on 500 characters
"set lbr
"set tw=500
"set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#262626

set autoindent "Auto indent
"set smartindent "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set pastetoggle=<F2>

" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Enable mouse support in console
set mouse=a

" Line Numbers PWN!
set number

nnoremap <F3> :set nonumber!<CR>

" When I close a tab, remove the buffer
set nohidden

"{{{ Functions

"{{{ Open URL in browser

function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!firefox ".line
endfunction

"}}}

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

set cursorline " highlight current line
hi CursorLine term=NONE cterm=none
hi Cursor term=reverse cterm=reverse gui=reverse guibg=NONE guifg=NONE

set ttyfast                   " we have a fast terminal
set undolevels=1000           " 1000 undos
set linebreak
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set showmode
" nore , ;
" nore . :

" Gui stuff
if has('gui_running')
  set guifont=Ubuntu\ Mono\ 11
endif
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set guioptions-=M

set ttymouse=sgr

"""""""""""""""""""
" Plugins config after
"""""""""""""""""""
" gitgutter better color contrast
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

