"*******************************************************************************
" PLUGIN MANAGER (START BEFORE ANYTHING ELSE)
"*******************************************************************************

" global plugins (!= filetype plugins) are loaded automatically on vim start.
" either from system .../macros, ~/.config/vim/plugin, ~/.config/vim/autoload

" DEIN INSTALLATION:
"   1. curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
"   2. sh ./installer.sh ~/.vim/dein
"   3. open vim (there may be errors) and do :call dein#install()

set runtimepath+=$HOME/.vim/dein//repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.vim/dein/')
  call dein#begin('$HOME/.vim/dein/')
  call dein#add('$HOME/.vim/dein//repos/github.com/Shougo/dein.vim')

  " update installed plugins: do ':call dein#update()'
  " remove installed plugins: just delete the below 'add' line for the plugin

  call dein#add( 'flazz/vim-colorschemes')
  "Plugin 'vim-airline/vim-airline'
  "Plugin 'vim-airline/vim-airline-themes'
  call dein#add('scrooloose/nerdtree')
  call dein#add('xuyuanp/nerdtree-git-plugin')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('regedarek/zoomwin')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('wesq3/vim-windowswap')
  call dein#add('sjl/gundo.vim')
  call dein#add('tpope/vim-capslock')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('sickill/vim-pasta')
  call dein#add('ervandew/supertab')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('luochen1990/rainbow')
  call dein#add('brookhong/cscope.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('nacitar/a.vim')

  call dein#end()
  call dein#save_state()
endif

" automatically install above-listed plugins on startup
if dein#check_install()
  call dein#install()
endif

"*******************************************************************************
" VIM MODE / BEHAVIOR
"*******************************************************************************

set nocompatible                " disable vi defaults, and enable/allow vim-only features
set nolazyredraw                " don't redraw while executing macros/registers
set ttyfast                     " assume fast term connection; send more chars
set noerrorbells                " don't audible alert bells
set visualbell t_vb=            " don't visual alert bells

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
" STARTUP
"*******************************************************************************

" clear all autocommands. (if .vimrc is sourced twice, the auto-
" cmds will appear twice.  this starts clean slate).
autocmd!

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

" enable loading of indent.vim file for specific file types
filetype indent on

"*******************************************************************************
" FONTS / COLORS
"*******************************************************************************

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " set vim-specific sequences for RGB colors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " set vim-specific sequences for RGB colors
set termguicolors               " use highlight-guifg/guibg attribs in term vim
set guifont=Inconsolata\ 18     " gvim font (note: term vim font uses urxvt font)
set background=dark             " required for many color schemes
colorscheme codeschool          " pick one from ~/.vim/vundle/vim-colorschemes/colors/

"*******************************************************************************
" CURSOR / LINE / COL HIGHLIGHTING [vim-indent-guides]
"*******************************************************************************

" gvim only: cursor block/blink
if has ('gui_running')
  set guicursor+=a:block-Cursor
  set guicursor+=a:blinkon0
endif

set cursorline                  " shade the active line
set colorcolumn=81              " set permanent colorschemed stripe down col 81

" highlight indented code columns
let g:indent_guides_enable_on_vim_startup = 0

"*******************************************************************************
" GUI MENUBARS
"*******************************************************************************

let did_install_default_menus = 1 " do not load default menus on startup
let did_install_syntax_menu = 1   " do not load syntax menu on startup

if has ('gui_running')
  set guioptions-=m               " GVIM: remove menubar
  set guioptions-=T               " GVIM: remove toolbar
  set guioptions-=r               " GVIM: remove right-hand scroll bar
  set guioptions-=L               " GVIM: remove left-hand scroll bar
  set guiheadroom=0               " GVIM: remove gtk wdo pad/border (not working!)
endif

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
" STATUSLINE
"*******************************************************************************

set laststatus=2                              " always show status line above cmd buffer

set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/

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
" LINE / CHAR DISPLAY [rainbow]
"*******************************************************************************

set number                      " show line numbers
set norelativenumber            " show line numbers as relative to current line
set scrolloff=3                 " keep at least 5 lines around the cursor
set nowrap                      " don't wrap long lines
set showmatch                   " show matching paired chars
set matchpairs=(:),{:},[:]      " set which paired chars to match
set list                        " show invisible characters
set listchars=tab:»·,trail:·    " but only show tabs and trailing whitespace

let g:rainbow_active = 1        " enable rainbow parens on startup

"*******************************************************************************
" BUFFERS
"*******************************************************************************

set nohidden                    " disable hidden (not visble, unsaved) bufs
set noconfirm                   " prompt when switching from unsaved buf

"*******************************************************************************
" SPLITS
"*******************************************************************************

set splitbelow                  " create new splits below current one
set splitright                  " create new splits to right of current one

"*******************************************************************************
" TEXT SEARCHING
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
" FILE FINDING / OPENING [ctrlp.vim]
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
" CODE PROCESSING [cscope.vim]
"*******************************************************************************

let g:cscope_silent = 1                       " don't show cscope db update msg on save

"*******************************************************************************
" CODE SYNTAX [syntastic]
"*******************************************************************************

" enable processing of syntax file (file with highlighting rules for detected
" filetype), either from system .../syntax dir or ~/.config/vim/syntax
" syntax enable                 " keep user highlight color settings
" syntax on                     " override user setting with syntax file
" au FileType javascript : syntax on " selectively enable syntax file processing, only for certain file types

syntax enable

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


"*******************************************************************************
"*******************************************************************************
" KEYMAPS
"*******************************************************************************
"*******************************************************************************

" [mapkeyword] [fromkeys] [tokeys]
" map Q j        ...If j mapped to anything, map calls that j map recursively
" noremap Q j    ...Just map Q to j, and ignore any j mappings that exist
" [n/i/v]noremap ...Apply the map to edit mode (n), ins mode (i), vis mode (v)


" LEADER KEY
"*******************************************************************************

let mapleader = ","
let maplocalleader = ","

" MODE SWITCH
"*******************************************************************************

nnoremap ; :
nnoremap : ;
inoremap jj <Esc>

" NAVIGATION
"*******************************************************************************

nnoremap - $
vnoremap - $

" COPY / PASTE [vim-pasta]
"*******************************************************************************

nnoremap Y y$
nnoremap I 0i
nnoremap u :undo<CR>
nnoremap U :redo<CR>

" toggle paste mode with <F7>, paste from clipboard in insert mode with
" CTRL-V, and copy visual mode selection to clipboard with CTRL-C
set pastetoggle=<F7>
inoremap <C-v> <F7><C-r>+<F7>
vnoremap <C-c> "+y

" CURSOR / LINE / COL HIGHLIGHTING [vim-indent-guides]
"*******************************************************************************

nnoremap <Leader>i :IndentGuidesToggle<CR>

" LOCATION / QUICKFIX [cscope.vim]
"*******************************************************************************

nnoremap <silent> <leader>l :call ToggleLocationList()<CR>

" LINE / CHAR DISPLAY [rainbow]
"*******************************************************************************

" code folds open/close code with spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" rainbowparentheses toggle
nnoremap <Leader>p :RainbowToggle<CR>

" BUFFERS
"*******************************************************************************

" buffers: go to previous buffer
nnoremap <Home> <C-^>
nnoremap <End> <C-^>

" SPLITS [vim-tmux-navigator] [zoomwin]
"*******************************************************************************

" open a copy of current file in another split
nnoremap <C-CR> :split<CR>

" navigation
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>

" move window to far left/right/bottom/top
nnoremap <silent> <C-i> <C-w>H
nnoremap <silent> <C-o> <C-w>L
nnoremap <silent> <C-m> <C-w>J
nnoremap <silent> <C-u> <C-w>K

" resize split with vertical inc/dec, or horizontal inc/dec, reset
nnoremap <silent> <up> :resize +1<CR>
nnoremap <silent> <down> :resize -1<CR>
nnoremap <silent> <left> :vertical resize -1<CR>
nnoremap <silent> <right> :vertical resize +1<CR>
nnoremap <silent> <C-r> <C-w>=

" previous split
nnoremap <silent> <BS> :TmuxNavigatePrevious<CR>

" rotate through all splits
nnoremap <silent> <Tab> <C-w>w

" zoom window: toggle fullscreen on current split
nnoremap <silent> <C-f> :ZoomWin<CR>
inoremap <silent> <C-f> :ZoomWin<CR>

" EDITING [vim-capslock] [nerdcommenter]
"*******************************************************************************

" toggle an insert-mode-only capslock
imap <C-Esc> <Plug>CapsLockToggle

" nerdcommenter: do not use default keymaps
let g:NERDCreateDefaultMappings = 0

" single-comment / uncomment selected lines
nmap <Leader>cc <Plug>NERDCommenterToggle
vmap <Leader>cc <Plug>NERDCommenterToggle

" verbose-block-comment selected lines
nmap <Leader>cv <Plug>NERDCommenterSexy
vmap <Leader>cv <Plug>NERDCommenterSexy

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

" FILE BROWSER [nerdtree]
"*******************************************************************************

" toggle view of nerdtree on/off
nnoremap <Leader>T :NERDTreeToggle<CR>

" switch to nerdtree
nnoremap <silent> <Leader>t :NERDTreeFocus<CR>

let g:NERDTreeMapToggleBookmarks = "b"        " show bookmarks view
let g:NERDTreeMapDeleteBookmark = "<Del>"     " delete the selected bookmark
let g:NERDTreeMapActivateNode = "l"           " expand dir or open file and switch to it
let g:NERDTreeMapOpenRecursively = "L"        " expand dir recursively
let g:NERDTreeMapOpenSplit = "s"              " open file in split and switch to it
let g:NERDTreeMapOpenVSplit = "v"             " open file in vert-split and switch to it
let g:NERDTreeMapCloseDir = "h"               " close parent dir of current position
let g:NERDTreeMapCloseChildren = "x"          " close selected dir and subdirs recursively
let g:NERDTreeMapJumpNextSibling = "J"        " move to next dir in current level
let g:NERDTreeMapJumpPrevSibling = "K"        " move to previous dir in current level
let g:NERDTreeMapJumpParent = "u"             " move to parent dir
let g:NERDTreeMapJumpRoot = "U"               " move to nerdtree-root-dir
let g:NERDTreeMapChangeRoot = "c"             " make parent dir of curr pos the nerdtree-root-dir
let g:NERDTreeMapUpdirKeepOpen = "C"          " make the nerdtree-root-dir go up one dir
let g:NERDTreeMapRefresh = "r"                " refresh listing of parent dir of curr pos
let g:NERDTreeMapRefreshRoot = "R"            " refresh listing of nerdtree-root-dir recursively
let g:NERDTreeMapMenu = "m"                   " enter create/delete/move menu for selected file or parent dir

" FILE FINDING / OPENING [ctrlp.vim] [a.vim]
"*******************************************************************************

" enter ctrl-p in file-search mode
nnoremap <silent> <Leader>f :CtrlP<CR>

" enter ctrl-p in open-buffers mode
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" enter ctrl-p in most-recently-used mode
nnoremap <silent> <Leader>r :CtrlPMRU<CR>

" ctrl-p search window bindings
let g:ctrlp_prompt_mappings = {
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<tab>'],
  \ 'PrtExit()':            ['<home>', '<end>', '<esc>']
  \ }

" a.vim: alternate between .c file and .h file
nnoremap <silent> <leader>aa :A<CR>

" a.vim: open corresponding .c/.h file in new vertical split
nnoremap <silent> <leader>av :AV<CR>

" a.vim: open corresponding .c/.h file in new horizontal split
nnoremap <silent> <leader>as :AS<CR>

" UNDO TREE BROWSING [gundo.vim]
"*******************************************************************************

nnoremap <silent> <Leader>u :GundoToggle<CR>

"*******************************************************************************
" CODE PROCESSING [cscope.vim]
"*******************************************************************************

" enter query in interactive mode
nnoremap <leader>sa :call CscopeFindInteractive(expand('<cword>'))<CR>

" find this c symbol
nnoremap  <leader>ss :call CscopeFind('s', expand('<cword>'))<CR>

" find this definition
nnoremap  <leader>sg :call CscopeFind('g', expand('<cword>'))<CR>

" find functions calling this function
nnoremap  <leader>sc :call CscopeFind('c', expand('<cword>'))<CR>

" find functions that this function uses/calls
nnoremap  <leader>sd :call CscopeFind('d', expand('<cword>'))<CR>

" find this text string
nnoremap  <leader>st :call CscopeFind('t', expand('<cword>'))<CR>

" find this egrep pattern
nnoremap  <leader>se :call CscopeFind('e', expand('<cword>'))<CR>

" find this file
nnoremap  <leader>sf :call CscopeFind('f', expand('<cword>'))<CR>

" find files #including this file
nnoremap  <leader>si :call CscopeFind('i', expand('<cword>'))<CR>

" CODE SYNTAX [syntastic]
"*******************************************************************************

" toggle syntastic errors panel
nnoremap <silent> <Leader>e :<C-u>call ToggleErrors()<CR>

" kill syntastic errors panel and errors sidebar (i.e. "signs" column)
nnoremap <silent> <Leader>E :lclose<CR>:SyntasticReset<CR>

" go to next syntastic error/warning
nnoremap <silent> <Leader>. :call WrapList('down', 'l')<CR>

" go to previous syntastic error/warning
nnoremap <silent> <Leader>, :call WrapList('up', 'l')<CR>

" GIT INTEGRATION [vim-gitgutter]
"*******************************************************************************

" gitgutter: do not use default keymaps
let g:gitgutter_map_keys = 0

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

" MISC
"*******************************************************************************

" keep weird stuff from happening
unmap <Enter>

