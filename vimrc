set background=dark

set nocompatible    " Use Vim defaults (much better!)

set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " incremental searching
set showmatch

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

set noautoindent

set textwidth=78
"Wrap at this column

set backspace=indent,eol,start
"Make backspaces delete sensibly

set tabstop=4
"Indentation levels every four columns

set shiftwidth=4
"Indent/outdent by four columns

set shiftround
"Indent/outdent to nearest tabstop

set matchpairs+=<:>
"Allow % to bounce between angles too

set ignorecase
set smartcase " if pattern contains uppercase, override

set nobackup

" disable any bells or visual indication
set novisualbell
set noerrorbells
set vb t_vb=
			
set binary noeol

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  autocmd GUIEnter * set vb t_vb=
endif

" expand tabs into spaces for these file types
autocmd BufNewFile,BufRead *.java setlocal expandtab
autocmd BufNewFile,BufRead *.c setlocal expandtab
autocmd BufNewFile,BufRead *.cc setlocal expandtab
autocmd BufNewFile,BufRead *.cpp setlocal expandtab
autocmd BufNewFile,BufRead *.h setlocal expandtab
autocmd BufNewFile,BufRead *.hh setlocal expandtab
autocmd BufNewFile,BufRead *.hpp setlocal expandtab
autocmd BufNewFile,BufRead *.xml setlocal expandtab
autocmd BufNewFile,BufRead *.sql setlocal expandtab
autocmd BufNewFile,BufRead *.pl setlocal expandtab
autocmd BufNewFile,BufRead *.pm setlocal expandtab

" set a reasonable search color
highlight search guibg=LightBlue
highlight search ctermbg=LightBlue

filetype indent off
set noautoindent
set nocindent
set nosmartindent
set indentexpr=

" disable annoying auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


map <F2> :%!perltidy<C-M>

map <F3> !perl -I/local/umrperl/libs -MUMR::SQLTidy -e SQLTidyWrapper<C-M>
