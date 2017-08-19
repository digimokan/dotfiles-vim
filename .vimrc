"*******************************************************************************
" PLUGIN MANAGER (START BEFORE ANYTHING ELSE)
"*******************************************************************************

" global plugins (!= filetype plugins) are loaded automatically on vim start.
" either from system .../macros, ~/.config/vim/plugin, ~/.config/vim/autoload

" USE VUNDLE TO MANAGE PLUGINS.  Runs on top of Pathogen (which takes a distinct
" plugin's files and keeps them in one dir inside ~./vim/vundle).  Basically
" you get Pathogen's features, plus after defining plugins in vimrc, you get to
" manage them in the vim editor.
" INSTALLATION:
"   1. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/vundle/Vundle.vim

set nocompatible                " must disable vi, alow enhanced vim features
filetype off                    " temporarily disable filetype detection

set rtp+=~/.vim/vundle/Vundle.vim   " set vim runtimep to include vundle
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/

" initialize vundle (store bundles in ~/.vim/vundle/), begin plugin defs
call vundle#begin(expand('$HOME').'/.vim/vundle')

" define the vundle plugin itself, so it can update itself after initial clone
Plugin 'VundleVim/Vundle.vim'

" define plugins located in GitHub repo
Plugin 'flazz/vim-colorschemes'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'regedarek/zoomwin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wesq3/vim-windowswap'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-capslock'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sickill/vim-pasta'
Plugin 'ervandew/supertab'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/indenthtml.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'brookhong/cscope.vim'
Plugin 'majutsushi/tagbar'
Plugin 'nacitar/a.vim'

" define plugins located at http://vim-scripts.org/vim/scripts.html
" Plugin 'ctrlp.vim'

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
" NOTE: YOU MAY NEED TO RELOAD VIMRC!
"   :PluginList       ...lists defined plugins
"   :PluginInstall    ...installs defined plugins
"   :PluginUpdate     ...updates defined plugins that have been installed
"   :PluginSearch foo ...searches some sources for foo plugins
"   :PluginClean      ...uninstall any plugins that are not defined

"*******************************************************************************
" VIM MODE
"*******************************************************************************

" disable vi defaults, and enable/allow vim-only features
set nocompatible

"*******************************************************************************
" STARTUP
"*******************************************************************************

" clear all autocommands. (if .vimrc is sourced twice, the auto-
" cmds will appear twice.  this starts clean slate).
autocmd!

"*******************************************************************************
" VIM SAVE FILES
"*******************************************************************************

" viminfo file stores session bufs/hist for next session ("viminfo=" disables)
set viminfo=

" vim swap files store autosave data for edited files...don't really need them
set noswapfile

set undofile                    " enable persistent undos stored in a file
set undodir=$HOME/.vim/undos    " dir with files to store undos for each buf
set undolevels=10000            " max num undos in a buf that can be undone
set undoreload=100000           " num undos to save in undo file for each buf

"*******************************************************************************
" FILETYPES
"*******************************************************************************

" edit new files with unix <LF>. and edit dos/mac in their native format.
set fileformats=unix,dos,mac

" enable filetype detection (c source, perl, etc.).  vim guesses filetype
" based on content (filetype detection necessary for filetype plugin / syntax)
filetype on

" enable loading of filetype plugin (file with vim cmds to run for detected
" filetype), either from system ftplugin dir or ~/.vim/ftplugin
filetype plugin on

"*******************************************************************************
" GUI MENUBARS
"*******************************************************************************

set guioptions-=m               " GVIM: remove menubar
set guioptions-=T               " GVIM: remove toolbar
set guioptions-=r               " GVIM: remove right-hand scroll bar
set guioptions-=L               " GVIM: remove left-hand scroll bar
set guiheadroom=0               " GVIM: remove gtk wdo pad/border (not working!)

"*******************************************************************************
" CMD BAR (BELOW STATUSLINE)
"*******************************************************************************

set cmdheight=1                 " make sure cmd line height stays at 1 line
set showcmd                     " show info about current cmd going on
set report=0                    " always report on any # of lines changed
set noshowmode                  " don't show current mode (ins mode vs cmd mode)
set noruler                     " show current line and column number
set wildmenu                    " enable wildmenu tab-completing cmds :e <Tab>
set wildmode=list:longest       " set wildmenu to list choice

"*******************************************************************************
" LINE NUMBERING
"*******************************************************************************

set number                      " show line numbers
set norelativenumber            " show line numbers as relative to current line

"*******************************************************************************
" ALERTS
"*******************************************************************************

set noerrorbells                " don't audible alert bells
set visualbell t_vb=            " don't visual alert bells

"*******************************************************************************
" VIM REFRESH
"*******************************************************************************

set nolazyredraw                " don't redraw while executing macros/registers
set ttyfast                     " assume fast term connection; send more chars

"*******************************************************************************
" LINE/CHAR DISPLAY [rainbow_parentheses]
"*******************************************************************************

set scrolloff=3                 " keep at least 5 lines around the cursor
set nowrap                      " don't wrap long lines
set showmatch                   " show matching paired chars
set matchpairs=(:),{:},[:]      " set which paired chars to match
set list                        " show invisible characters
set listchars=tab:»·,trail:·    " but only show tabs and trailing whitespace

autocmd VimEnter * RainbowParenthesesToggle   " turn on rainbow parens
autocmd Syntax * RainbowParenthesesLoadRound  " enable () rainbow parens
autocmd Syntax * RainbowParenthesesLoadSquare " enable [] rainbow parens
autocmd Syntax * RainbowParenthesesLoadBraces " enable {} rainbow parens

"*******************************************************************************
" SPLITS
"*******************************************************************************

set splitbelow                  " create new splits below current one
set splitright                  " create new splits to right of current one

"*******************************************************************************
" BUFFERS
"*******************************************************************************

set nohidden                    " disable hidden (not visble, unsaved) bufs
set noconfirm                   " prompt when switching from unsaved buf

"*******************************************************************************
" SEARCHING
"*******************************************************************************

set nohlsearch                  " don't highlight previously searched expressions
set incsearch                   " highlight currently searched expressions
set matchtime=5                 " blink matching chars for .x seconds
set completeopt=menu,longest,preview " ins mode autocomplete <Ctrl>-P options
set nostartofline               " don't go to start-of-line when <Ctrl>-d/u/f/b

"*******************************************************************************
" EDITING
"*******************************************************************************

set backspace=2                 " allow backspacing over auto-indent/line-br/ins
set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines

"*******************************************************************************
" INDENTS / TABS
"*******************************************************************************

set autoindent                  " when starting new line, use prev line indent
set shiftwidth=2                " spaces for each step of autoindent
set shiftround                  " always round indents to multiple of shiftwidth
set expandtab                   " when tab is pressed use seq of spaces instead
set softtabstop=2               " set seq of 2 spaces for expandtab
set tabstop=4                   " if existing file with tabs, each tab = 4 sp
set copyindent                  " if existing indents have tabs/sp, use that
set preserveindent              " if tabbing onto existing indent, keep exist

"*******************************************************************************
" FONTS / COLORS
"*******************************************************************************

" turn on 256 color in the linux terminal
" set t_Co=256

" NOTE: for gvim only
if has ('gui_running')
  set guifont=Inconsolata\ 18
  set background=dark
  colorscheme codeschool
endif

"*******************************************************************************
" CURSOR / LINE / COL HIGHLIGHTING
"*******************************************************************************

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

"*******************************************************************************
" FILE BROWSER [nerdtree]
"*******************************************************************************

let g:NERDTreeWinSize = 20                    " horizontal size of nerdtree
let g:NERDTreeMinimalUI = 1                   " do not show top help/info msg
let g:NERDTreeShowHidden = 1                  " show hidden files in the nerdtree
let g:NERDTreeChDirMode = 2                   " always set vim curr wkg dir to  nerdtree base dir

" open nerdtree automatically if vim is used to open a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"*******************************************************************************
" FILE SEARCHING / OPENING [ctrlp.vim]
"*******************************************************************************

let g:ctrlp_match_window = 'min:1,max:10'     " min/max results-window height
let g:ctrlp_match_window_reversed = 0         " display results from top-to-bottom (need both!)
let g:ctrlp_match_window = 'order:ttb'        " display results from top-to-bottom (need both!)
let g:ctrlp_match_window = 'results:100'      " max results to display
let g:ctrlp_working_path_mode = 'w'           " search-root-dir = nerdtree-root
let g:ctrlp_switch_buffer = 'et'              " goto found file instead of opening new copy
let g:ctrlp_show_hidden = 1                   " search for hidden files

"*******************************************************************************
" UNDO TREE BROWSING [gundo.vim]
"*******************************************************************************

let g:gundo_width = 80                        " width of gundo column
let g:gundo_preview_height = 15               " height of prev box in gundo col
let g:gundo_right = 1                         " put gundo col on far right

"*******************************************************************************
" CODE SYNTAX [syntastic]
"*******************************************************************************

" enable processing of syntax file (file with highlighting rules for detected
" filetype), either from system .../syntax dir or ~/.config/vim/syntax
" syntax enable                 " keep user highlight color settings
" syntax on                     " override user setting with syntax file
" au FileType javascript : syntax on " selectively enable syntax file processing, only for certain file types

" gvim only: enable syntax
if has ('gui_running')
  syntax enable
endif

let g:syntastic_check_on_open = 0             " check syntax on file open
let g:syntastic_always_populate_loc_list = 1  " always auto-open error window
let g:syntastic_check_on_wq = 0               " do not check when closing file
let g:syntastic_aggregate_errors = 1          " combine errs from mult checkers
let g:syntastic_warning_symbol = "▬▶"         " warning symbol in margin
let g:syntastic_error_symbol = "▬▶"           " error symbol in margin
let g:syntastic_style_warning_symbol = "?⚐"   " style warning symbol in margin
let g:syntastic_style_error_symbol = "?☒"     " style error symbol in margin
let g:syntastic_stl_format = "%E{☒ %e}%W{ ⚐ %w}"      " statusline flag: num errs/warns
highlight SignColumn guibg=#3a3a3a
highlight SyntasticErrorSign guifg=#990000 guibg=#3a3a3a
highlight SyntasticWarningSign guifg=#df5f00 guibg=#3a3a3a

let g:syntastic_sh_checkers = ['checkbashisms']   " from aur: checkbashisms
let g:syntastic_c_checkers = ['gcc']              " from arch: gcc
let g:syntastic_c_check_header = 1
let g:syntastic_c_include_dirs = ["..", ".", "includes", "headers"]
let g:syntastic_javascript_checkers = ['eslint']  " from npm: eslint, babel-eslint, eslint-plugin-react
let g:syntastic_java_checkers = ['javac']         " did not have to install
let g:syntastic_scala_checkers = ['scalac']       " from arch: scala
let g:syntastic_lisp_checkers = ['clisp']         " from arch: clisp

" a function toggle the syntastic error panel (i.e. vim "location list")
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

" function to allow rotating-goto errors/warnings
function! WrapList(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction

"*******************************************************************************
" GIT INTEGRATION [vim-gitgutter]
"*******************************************************************************

let g:gitgutter_diff_base = 'HEAD'            " diff against index (default) or specific commit
let g:gitgutter_map_keys = 0                  " disable default keymaps, and use my own below

"*******************************************************************************
" CODE PROCESSING [cscope.vim]
"*******************************************************************************

let g:cscope_silent = 1                       " don't show cscope db update msg on save

"*******************************************************************************
" STATUSLINE
"*******************************************************************************

set laststatus=2                              " always show status line above cmd buffer

"if !exists('g:airline_symbols')               " define symbol list as needed
  "let g:airline_symbols = {}
"endif
"let g:airline_powerline_fonts=1
"let g:airline_left_sep = ""                  " left-side field separator
"let g:airline_left_alt_sep = ""              " left-side fallback field sep
"let g:airline_right_sep = ""                 " right-side field separator
"let g:airline_right_alt_sep = ""             " right-side fallback field sep
"let g:airline_symbols.branch = ""            " symbol for branch
"let g:airline_symbols.readonly = ""          " symbol for read-only file
"let g:airline_symbols.linenr = ""            " symbol for line-number
"let g:airline_symbols.maxlinenr = ""          " symbol for max-line-number
"let g:airline_symbols.paste = "ρ"             " symbol for paste mode
"let g:airline_symbols.spell = "Ꞩ"             " symbol for spell check (?)
"let g:airline_symbols.notexists = "∄"         " symbol for not exists (?)
"let g:airline_symbols.whitespace = "Ξ"        " symbol for whitespace (?)

"if !exists('g:airline_theme')                 " set airline theme
  "let g:airline_theme = "bubblegum"
"endif

"*******************************************************************************
" KEYMAPS
"*******************************************************************************

" [mapkeyword] [fromkeys] [tokeys]
" map Q j        ...If j mapped to anything, map calls that j map recursively
" noremap Q j    ...Just map Q to j, and ignore any j mappings that exist
" [n/i/v]noremap ...Apply the map to edit mode (n), ins mode (i), vis mode (v)

" map the leader key, then use it in combos with "<Leader>[key]"
let mapleader = ","
let maplocalleader = ","
" swap ";" and ":"
nnoremap ; :
nnoremap : ;
" "jj" to escape from insert mode to cmd mode
inoremap jj <Esc>

" "Y" yanks from cursor to EOL (just like D)
nnoremap Y y$
" "I" inserts at >>beginning of the line<<
nnoremap I 0i
" "u" to undo
nnoremap u :undo<CR>
" "U" to redo
nnoremap U :redo<CR>

" in cmd mode, "-" works like $ (end of line)
nnoremap - $
" in vis mode, "-" works like $ (end of line)
vnoremap - $

" toggle paste mode with <F7>, paste from clipboard in insert mode with
" CTRL-V, and copy visual mode selection to clipboard with CTRL-C
set pastetoggle=<F7>
inoremap <C-v> <F7><C-r>+<F7>
vnoremap <C-c> "+y

" location window toggle (used by cscope)
nnoremap <leader>l :call ToggleLocationList()<CR>

" buffers: go to previous buffer
nnoremap <Home> <C-^>
nnoremap <End> <C-^>

" splits: open a copy of current file in another split
nnoremap <C-Cr> :split<CR>
" splits: navigation
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
" splits: move window to far left/right/bottom/top
nnoremap <C-i> <C-w>H
nnoremap <C-o> <C-w>L
nnoremap <C-m> <C-w>J
nnoremap <C-u> <C-w>K
" splits: resize split with vertical inc/dec, or horizontal inc/dec, reset
nnoremap <up> :resize +1<CR>
nnoremap <down> :resize -1<CR>
nnoremap <left> :vertical resize -1<CR>
nnoremap <right> :vertical resize +1<CR>
nnoremap <C-r> <C-w>=
" splits: previous split
nnoremap <silent> <BS> :TmuxNavigatePrevious<cr>
" splits: rotate through all splits
nnoremap <Tab> <C-w>w

" zoom window: toggle fullscreen on current split
nnoremap <C-f> :ZoomWin<CR>
inoremap <C-f> :ZoomWin<CR>

" guizoom: inc/dec/reset gui font size
"nnoremap <C-Up> :ZoomIn<CR>
"nnoremap <C-Down> :ZoomOut<CR>
"nnoremap <C-=> :ZoomReset<CR>

" gundo: show interactive tree of undos
nnoremap <silent> <Leader>u :GundoToggle<CR>

" capslock toggle an insert-mode-only capslock
nmap <Leader><Esc> <Plug>CapsLockToggle
imap <C-Esc> <Plug>CapsLockToggle

" nerdcommenter: do not use default keymaps
let g:NERDCreateDefaultMappings = 0
" single-comment / uncomment selected lines
nmap <Leader>cc <Plug>NERDCommenterToggle
vmap <Leader>cc <Plug>NERDCommenterToggle
" verbose-block-comment selected lines
nmap <Leader>cv <Plug>NERDCommenterSexy
vmap <Leader>cv <Plug>NERDCommenterSexy

" in cmd mode, map toggle view of nerdtree on/off
nnoremap <Leader>T :NERDTreeToggle<CR>
" in cmd mode, switch to nerdtree
nnoremap <silent> <Leader>t :NERDTreeFocus<CR>
" in nerdtree, map show bookmarks view
let g:NERDTreeMapToggleBookmarks = "b"
" in nerdtree, expand dir or open file and switch to it ("gl" does not switch)
let g:NERDTreeMapActivateNode = "l"
" in nerdtree, open file in split and switch to it ("gs" does not switch)
let g:NERDTreeMapOpenSplit = "s"
" in nerdtree, open file in vert-split and switch to it ("vs" does not switch)
let g:NERDTreeMapOpenVSplit = "v"
" in nerdtree, expand dir recursively
let g:NERDTreeMapOpenRecursively = "L"
" in nerdtree, close parent dir of current position
let g:NERDTreeMapCloseDir = "h"
" in nerdtree, close selected dir and subdirs recursively
let g:NERDTreeMapCloseChildren = "x"
" in nerdtree, move to next dir in current level
let g:NERDTreeMapJumpNextSibling = "J"
" in nerdtree, move to previous dir in current level
let g:NERDTreeMapJumpPrevSibling = "K"
" in nerdtree, move to parent dir
let g:NERDTreeMapJumpParent = "u"
" in nerdtree, move to nerdtree-root-dir
let g:NERDTreeMapJumpRoot = "U"
" in nerdtree, make parent dir of current position the nerdtree-root-dir
let g:NERDTreeMapChangeRoot = "c"
" in nerdtree, move the nerdtree-root-dir up one dir
let g:NERDTreeMapUpdirKeepOpen = "C"
" in nerdtree, refresh listing of parent dir of current position
let g:NERDTreeMapRefresh = "r"
" in nerdtree, refresh listing of nerdtree-root-dir recursively
let g:NERDTreeMapRefreshRoot = "R"
" in nerdtree, open create/delete/move menu for selected file or parent dir
let g:NERDTreeMapMenu = "m"
" in nerdtree, delete the selected bookmark
let g:NERDTreeMapDeleteBookmark = "<Del>"

" control-p enter in file-search mode
nnoremap <Leader>f :CtrlP<CR>
" control-p enter in open-buffers mode
nnoremap <Leader>b :CtrlPBuffer<CR>
" control-p enter in most-recently-used mode
nnoremap <Leader>r :CtrlPMRU<CR>
" control-p search window bindings
let g:ctrlp_prompt_mappings = {
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<tab>'],
  \ 'PrtExit()':            ['<home>', '<end>', '<esc>']
  \ }

" syntastic toggle errors panel
nnoremap <silent> <Leader>e :<C-u>call ToggleErrors()<CR>
" syntastic kill errors panel and errors sidebar (i.e. "signs" column)
nnoremap <silent> <Leader>E :lclose<CR>:SyntasticReset<CR>
" syntastic go to next error/warning
nnoremap <silent> <Leader>. :call WrapList('down', 'l')<CR>
" syntastic go to previous error/warning
nnoremap <silent> <Leader>, :call WrapList('up', 'l')<CR>

" gitgutter toggle
nnoremap <Leader>gt :GitGutterToggle<CR>
" gitgutter view block as diff
nnoremap <Leader>gv :GitGutterPreviewHunk<CR>
" gitgutter line highlight on/off
nnoremap <Leader>gl :GitGutterLineHighlightsToggle<CR>
" gitgutter undo block of changes
nnoremap <Leader>gu :GitGutterUndoHunk<CR>
" gitgutter goto next block of changes
nnoremap <Leader>gg :GitGutterNextHunk<CR>
" gitgutter goto prev block of changes
nnoremap <Leader>gb :GitGutterPrevHunk<CR>

" code folds open/close code with spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" twiddlecase in visual mode rotates through lower/upper/title case
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap m y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" rainbowparentheses toggle
nnoremap <Leader>p :RainbowParenthesesToggle<CR>

" cscope s: enter query in interactive mode
nnoremap <leader>sa :call CscopeFindInteractive(expand('<cword>'))<CR>
" cscope s: find this c symbol
nnoremap  <leader>ss :call CscopeFind('s', expand('<cword>'))<CR>
" cscope g: find this definition
nnoremap  <leader>sg :call CscopeFind('g', expand('<cword>'))<CR>
" cscope c: find functions calling this function
nnoremap  <leader>sc :call CscopeFind('c', expand('<cword>'))<CR>
" cscope d: find functions that this function uses/calls
nnoremap  <leader>sd :call CscopeFind('d', expand('<cword>'))<CR>
" cscope t: find this text string
nnoremap  <leader>st :call CscopeFind('t', expand('<cword>'))<CR>
" cscope e: find this egrep pattern
nnoremap  <leader>se :call CscopeFind('e', expand('<cword>'))<CR>
" cscope f: find this file
nnoremap  <leader>sf :call CscopeFind('f', expand('<cword>'))<CR>
" cscope i: find files #including this file
nnoremap  <leader>si :call CscopeFind('i', expand('<cword>'))<CR>

" a.vim: alternate between .c file and .h file
nnoremap <leader>aa :A<CR>
" a.vim: open corresponding .c/.h file in new vertical split
nnoremap <leader>av :AV<CR>
" a.vim: open corresponding .c/.h file in new horizontal split
nnoremap <leader>as :AS<CR>

" keep weird stuff from happening
unmap <Enter>

