"------------------------ ENVIRONMENT -----------------------"

" set up vim to load and use ~/.config/vim directory
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

"--------- START PLUGIN MANAGER BEFORE ANYTHING ELSE --------"

" global plugins (!= filetype plugins) are loaded automatically on vim start.
" either from system .../macros, ~/.vim/plugin, ~/.vim/autoload

" USE VUNDLE TO MANAGE PLUGINS.  Runs on top of Pathogen (which takes a distinct
" plugin's files and keeps them in one dir inside ~./vim/bundle).  Basically
" you get Pathogen's features, plus after defining plugins in vimrc, you get to
" manage them in the vim editor.
" INSTALLATION:
"   1. git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/vim/vundle/Vundle.vim

set nocompatible                " must disable vi, alow enhanced vim features
filetype off                    " temporarily disable filetype detection

set rtp+=~/.config/vim/vundle/Vundle.vim   " set vim runtimep to include vundle

call vundle#begin()
" " initialize vundle, begin plugin defs
" call vundle#begin(expand('$XDG_CONFIG_HOME').'/vim/vundle')

" define the vundle plugin itself, so it can update itself after initial clone
Plugin 'VundleVim/Vundle.vim'

" define plugins located in GitHub repo
Plugin 'flazz/vim-colorschemes'
" Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/nerdtree'

" define plugins located at http://vim-scripts.org/vim/scripts.html
Plugin 'indenthtml.vim'

" define plugins located on a website
" Plugin 'git://git.wincent.com/command-t.git'

" define plugins located on local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" define plugin located in vim subdir of rstacruz/sparkup repo
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" define plugin and give it a new name, to avoid existing name conflict
" Plugin 'user/L9', {'name': 'newL9'}

call vundle#end()                   " end plugin defs

" VUNDLE USAGE IN VIM CMD MODE:
"   :PluginList       ...lists defined plugins
"   :PluginInstall    ...installs defined plugins
"   :PluginUpdate     ...updates defined plugins that have been installed
"   :PluginSearch foo ...searches some sources for foo plugins
"   :PluginClean      ...uninstall any plugins that are not defined

"--------------------------- META ---------------------------"

" clear all autocommands. (if .vimrc is sourced twice, the auto-
" cmds will appear twice.  this starts clean slate).
autocmd!

" disable vi defaults, and enable/allow vim-only features
set nocompatible

" edit new files with unix <LF>. and edit dos/mac in their native format.
set fileformats=unix,dos,mac

" viminfo file stores session buffers/hist for next session...don't!
set viminfo=

" enable filetype detection (c source, perl, etc.).  vim guesses filetype
" based on content (filetype detection necessary for filetype plugin / syntax)
filetype on

" enable loading of filetype plugin (file with vim cmds to run for detected
" filetype), either from system ftplugin dir or ~/.vim/ftplugin
filetype plugin on

" turn on 256 color in the linux terminal
" set t_Co=256

" enable processing of syntax file (file with highlighting rules for detected
" filetype), either from system .../syntax dir or ~/.config/vim/syntax
" syntax enable                 " keep user highlight color settings
" syntax on                     " override user setting with syntax file

" gvim only: enable syntax
if has ('gui_running')
  syntax enable
endif

" selectively enable syntax file processing, only for certain file types
" au FileType javascript : syntax on

"---------------------------- UI ----------------------------"

set guioptions-=m               " GVIM: remove menubar
set guioptions-=T               " GVIM: remove toolbar
set guioptions-=r               " GVIM: remove right-hand scroll bar
set guioptions-=L               " GVIM: remove left-hand scroll bar
set guiheadroom=0               " GVIM: remove gtk wdo pad/border (not working!)

set cmdheight=1                 " make sure cmd line height stays at 1 line
set showcmd                     " show info about current cmd going on
set showmode                    " show the current mode (ins mode vs cmd mode)
set number                      " show line numbers
set relativenumber              " show line numbers as relative to current line
set ruler                       " show current line and column number
set noerrorbells                " don't audible alert bells
set visualbell t_vb=            " don't visual alert bells
set lazyredraw                  " don't redraw while executing macros/registers
set ttyfast                     " assume fast term connection; send more chars
set scrolloff=5                 " keep at least 5 lines around the cursor
set nowrap                      " don't wrap long lines
set list                        " show invisible characters
set listchars=tab:>·,trail:·    " but only show tabs and trailing whitespace
set report=0                    " always report on any # of lines changed
set wildmenu                    " enable wildmenu tab-completing cmds :e <Tab>
set wildmode=list:longest       " set wildmenu to list choice

"------------ TEXT EDITING / SEARCHING BEHAVIOR -------------"

set nohlsearch                  " don't highlight previously searched expressions
set incsearch                   " highlight currently searched expressions
set matchtime=5                 " blink matching chars for .x seconds
set completeopt=menu,longest,preview " ins mode autocomplete <Ctrl>-P options
set nostartofline               " don't go to start-of-line when <Ctrl>-d/u/f/b
set backspace=2                 " allow backspacing over auto-indent/line-br/ins
set showmatch                   " show matching paired chars
set matchpairs=(:),{:},[:]      " set which paired chars to match
set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines

"-------------------- INDENTS AND TABS ----------------------"

set autoindent                  " when starting new line, use prev line indent
set shiftwidth=2                " spaces for each step of autoindent
set shiftround                  " always round indents to multiple of shiftwidth
set expandtab                   " when tab is pressed use seq of spaces instead
set softtabstop=2               " set seq of 2 spaces for expandtab
set tabstop=4                   " if existing file with tabs, each tab = 4 sp
set copyindent                  " if existing indents have tabs/sp, use that
set preserveindent              " if tabbing onto existing indent, keep exist

"---------------------- KEYMAPPINGS -------------------------"

" [mapkeyword] [fromkeys] [tokeys]
" map Q j        ...If j mapped to anything, map calls that j map recursively
" noremap Q j    ...Just map Q to j, and ignore any j mappings that exist
" [n/i/v]noremap ...Apply the map to edit mode (n), ins mode (i), vis mode (v)

" in cmd mode, swap ";" and ":"
nnoremap ; :
nnoremap : ;

" in cmd mode, "T" joins next line to cursor position
nnoremap T J

" in cmd mode, "J" goes down one page
nnoremap J <C-F>

" in cmd mode, "K" goes up one page
nnoremap K <C-B>

" in cmd mode, "Y" yanks from cursor to EOL (just like D)
nnoremap Y y$

" in cmd mode, "I" inserts at >>beginning of the line<<
nnoremap I 0i

" in cmd mode, "123<ENTER>" goes to line 123 (instead of "123G<ENTER>")
nnoremap <cr> G

" in cmd mode, "-" works like $ (end of line)
nnoremap - $

" in vis mode, "-" works like $ (end of line)
vnoremap - $

" in insert mode, typing "jj" enters cmd mode
inoremap jj <Esc>

" toggle paste mode with <F7>, paste from clipboard in insert mode with
" CTRL-Y, and copy visual mode selection to clipboard with CTRL-C
set pastetoggle=<F7>
inoremap <C-v> <F7><C-r>+<F7>
vnoremap <C-c> "+y

" in cmd/insert modes, map P to toggle view of NerdTree On/Off
nnoremap P :NERDTreeToggle<CR>

" in cmd mode, switch between vim windows with W
nnoremap W <C-w>w

"------------------ FONTS / COLORSCHEME ---------------------"

" NOTE: for gvim only, and below is specific to solarized colorscheme:

if has ('gui_running')
  set guifont=Inconsolata\ 20
  set background=dark
  colorscheme codeschool
endif

"------------ CURSOR / LINE / COL HIGHLIGHTING --------------"

" gvim only: cursor block/blink
if has ('gui_running')
  set guicursor+=a:block-Cursor
  set guicursor+=a:blinkon0
endif

" shade the active line
set cursorline

" set the active line colors to blue line, white letters
highlight cursorline ctermfg=White ctermbg=DarkBlue

" set permanent dark gray stripe down col 81
highlight colorcolumn ctermbg=DarkGray guibg=#2E373B
set colorcolumn=81

"------------------ CUSTOM STATUS LINE ----------------------"

" set the base custom status line color
highlight statusline guifg=#FFFFFF guibg=#000000 ctermfg=White ctermbg=Black

" define custom status line colors (User 1-4 Are Special-Purpose Fields,
"     User8 Is Base Statusline Color, User9 Is Dynamic For Ins/Cmd Mode)
highlight User1 guifg=#000000 guibg=#549A6F ctermfg=Black ctermbg=Green
highlight User2 guifg=#000000 guibg=#CC68C8 ctermfg=Black ctermbg=Magenta
highlight User3 guifg=#000000 guibg=#FF2F2F ctermfg=Black ctermbg=Red
highlight User4 guifg=#000000 guibg=#F8FF00 ctermfg=Black ctermbg=Brown
highlight User8 guifg=#000000 guibg=#FFFFFF ctermfg=Black ctermbg=White
highlight User9 guifg=#000000 guibg=#FFFFFF ctermfg=Black ctermbg=White

" On entering insert mode, change to DarkGreen if entering insert mode, DarkCyan
" if entering replace mode, and DarkRed if entering visual insert mode
function! ModeColorChange(mode)
    if a:mode == 'i'
        highlight User9 guifg=#000000 guibg=#00FF18 ctermfg=Black ctermbg=DarkGreen
    elseif a:mode == 'r'
        highlight User9 guifg=#000000 guibg=#79C4CC ctermfg=Black ctermbg=DarkCyan
    elseif a:mode == 'R'
        highlight User9 guifg=#000000 guibg=#79C4CC ctermfg=Black ctermbg=DarkCyan
    elseif a:mode == 'v'
        highlight User9 guifg=#000000 guibg=#FF2F2F ctermfg=Black ctermbg=DarkRed
    elseif a:mode == 'V'
        highlight User9 guifg=#000000 guibg=#FF2F2F ctermfg=Black ctermbg=DarkRed
    else
        highlight User9 guifg=#000000 guibg=#FFFFFF ctermfg=Black ctermbg=White
    endif
endfunction

" change color of the "curr char hex value" part of statusline depending
" on whether in cmd mode or insert mode
au InsertEnter * call ModeColorChange(v:insertmode)
au InsertChange * call ModeColorChange(v:insertmode)
au InsertLeave * highlight User9 guifg=#000000 guibg=#FFFFFF ctermfg=Black ctermbg=White

set laststatus=2                " always show status line above cmd buffer

set statusline=%9*CHAR\ %04B\ %8*   " hex value of curr char
set statusline+=\|\ COL\ %03.c\ \|\ " curr column
set statusline+=LN\ %P\ of\     " percent through file
set statusline+=%L\ \|\         " total lines in file
set statusline+=BUF\ %02.n\ \|\ " curr buffer number
set statusline+=%2*%{&paste?'[PASTE]':''}%8*  " magenta "[PASTE]" in paste mode
set statusline+=\ %4*%m%8*        " brown "[+]" if file has unsaved changes

set statusline+=%<              " truncate from this pt fwd if term window small
set statusline+=%=              " right align everything below

set statusline+=%F\ \|\         " filename (full path)
set statusline+=[%{&ff}]\ \|\   " file format ("dos", "unix", "mac")
set statusline+=[%{&fenc}]\ \|\ " file encoding ("latin1", "utf-8", "utf-16")
set statusline+=%y\ \|\         " file type ("[c]", "[html]", "[md]")
set statusline+=%2*%r%8*        " read only flag as yellow "[RO]"

