"*******************************************************************************
" PLUGIN MANAGER (START BEFORE ANYTHING ELSE)
"*******************************************************************************

" global plugins (!= filetype plugins) are loaded automatically on vim start.
" either from system .../macros, ~/.config/vim/plugin, ~/.config/vim/autoload

" VIM-PLUG INSTALLATION:
"   1. curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   2. open vim and run PlugInstall

call plug#begin('$HOME/.vim/vimplug')

  " PlugUpgrade:    upgrade vim-plug itself
  " PlugInstall:    install plugins in below list
  " PlugDiff:       show changes that would be made on PlugUpdate
  " PlugSnapshot:   generate simple script to load curr commits of curr plugins
  " PlugUpdate:     install and update plugins in below list
  " Remove Plugin:  just remove from below list, then restart vim
  " PlugClean:      clean removed plugin dirs/files

  Plug 'nacitar/a.vim', {'on':['A','AV','AS']}
  Plug 'w0rp/ale'
  Plug 'tpope/vim-capslock'
  Plug 'flazz/vim-colorschemes'
  Plug 'brookhong/cscope.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'sjl/gundo.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'itchyny/lightline.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree', {'on':['NERDTree','NERDTreeToggle','NERDTreeFocus']}
  Plug 'xuyuanp/nerdtree-git-plugin', {'on':['NERDTree','NERDTreeToggle','NERDTreeFocus']}
  Plug 'sickill/vim-pasta'
  Plug 'sheerun/vim-polyglot'
  Plug 'luochen1990/rainbow'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'wesq3/vim-windowswap'
  Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
  Plug 'Valloric/YouCompleteMe', { 'frozen':1, 'commit':'65765ef', 'do':'./install.py --clang-completer --system-libclang' }
  Plug 'regedarek/zoomwin'

call plug#end()

"*******************************************************************************
" VIM MODE / BEHAVIOR
"*******************************************************************************

set nocompatible                " disable vi defaults, and enable/allow vim-only features
set ttimeoutlen=10              " keypress combo delay (speeds up some plugins)
set nolazyredraw                " don't redraw while executing macros/registers
set ttyfast                     " assume fast term connection; send more chars
set noerrorbells                " don't audible alert bells
set visualbell t_vb=            " don't visual alert bells
set secure exrc                 " source cwd .vimrc, but don't do dangerous cmds

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

set guifont=Inconsolata\ 18             " gvim font (term vim uses vt font)
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " set vim-specific seqs for RGB colors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " set vim-specific seqs for RGB colors
set termguicolors                       " use truecolors in term (if vt support)
set background=dark                     " sel light/dark for some color schemes
colorscheme gruvbox                     " ~/.vim/plug/vim-colorschemes/colors/
let g:gruvbox_invert_selection = 0      " shade vis sel (0), or reverse vid (1)
let g:gruvbox_italic           = 1      " gruvbox enable italic text
let g:gruvbox_contrast_dark    = 'soft' " gruvbox soft/medium/hard contrast
let g:gruvbox_contrast_light   = 'soft' " gruvbox soft/medium/hard contrast
let g:gruvbox_vert_split       = 'bg0'  " gruvbox vsplit sep col bg (│)
let g:gruvbox_sign_column      = 'bg0'  " gruvbox sign col bg (gitgutter/ale)
let g:gruvbox_number_column    = 'bg4'  " gruvbox line numbers col bg

"*******************************************************************************
" CURSOR / LINE / COL HIGHLIGHTING [vim-indent-guides]
"*******************************************************************************

" gvim only: cursor block/blink
if has ('gui_running')
  set guicursor+=a:block-Cursor
  set guicursor+=a:blinkon0
endif

set cursorline                  " shade active line (may slow term vim scroll!)
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

set laststatus=2                     " always show status line above cmd buffer

function! GetMode()
  let l:fname = expand('%:t')
  return l:fname == 'ControlP' ? 'CtrlP' :
    \ l:fname == '__Gundo__' ? 'Gundo' :
    \ l:fname == '__Gundo_Preview__' ? 'Gundo Preview' :
    \ l:fname =~ 'NERD_tree' ? 'NERDTree' :
    \ winwidth(0) > 40 ? lightline#mode() : ""
endfunction

function! GetCapslock()
  if (CapsLockStatusline() != "")
    return "CAPS"
  else
    return ""
endfunction

function! GetGitBranch()
  if (winwidth(0) > 80)
    if (fugitive#head() != "")
      return printf('☈ %s', fugitive#head())
    else
      return ""
    endif
  else
    return ""
  endif
endfunction

function! GetFileName()
  let l:fname = expand('%:t')
  return l:fname == 'ControlP' ? "" :
    \ l:fname == '__Gundo__' ? "" :
    \ l:fname == '__Gundo_Preview__' ? "" :
    \ l:fname =~ 'NERD_tree' ? "" :
    \ expand('%t')
endfunction

function! GetReadOnly()
  return &readonly ? '[℟]' : ""
endfunction

function! GetModified()
  return &modified ? '[+]' : ""
endfunction

function! GetPasteMode()
  return &paste ? '[ρ]' : ""
endfunction

function! GetAle()
  if (winwidth(0) > 55)
    return ALEGetStatusLine()
  else
    return ""
  endif
endfunction

augroup AutoALE
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

function! GetFileType()
  if (winwidth(0) > 115)
    return printf('%s', &filetype)
  else
    return ""
  endif
endfunction

function! GetColNum()
  if (winwidth(0) > 70)
    return printf('%3dC', col('.'))
  else
    return ""
  endif
endfunction

function! GetPercent()
  if (winwidth(0) > 70)
    return printf( '%3d%%', float2nr(((line('.') * 1.0) / (line('$') * 1.0)) * 100) )
  else
    return ""
  endif
endfunction

function! GetMaxLines()
  if (winwidth(0) > 40)
    return printf('%d', line('$'))
  else
    return ""
  endif
endfunction

let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'separator': {
    \ 'left':   '',
    \ 'right':  '' },
  \ 'subseparator': {
    \ 'left':  '│',
    \ 'right': '│' },
  \ 'active': {
    \ 'left':  [ [ 'mode', 'capslock' ],
               \ [ 'filename', 'readonly', 'modified', 'pastemode'],
               \ [ 'gitbranch' ] ],
    \ 'right': [ [ 'percent', 'maxlines' ],
               \ [ 'filetype', 'colnum' ],
               \ [ 'ale' ] ] },
  \ 'inactive': {
    \ 'left':  [ [ 'mode', 'capslock' ],
               \ [ 'filename', 'readonly', 'modified', 'pastemode'],
               \ [ 'gitbranch' ] ],
    \ 'right': [ [ 'percent', 'maxlines' ],
               \ [ 'filetype', 'colnum' ],
               \ [ 'ale' ] ] },
  \ 'component_function': {
    \ 'mode':      'GetMode',
    \ 'capslock':  'GetCapslock',
    \ 'gitbranch': 'GetGitBranch',
    \ 'filename':  'GetFileName',
    \ 'modified':  'GetModified',
    \ 'pastemode': 'GetPasteMode',
    \ 'ale':       'GetAle',
    \ 'filetype':  'GetFileType',
    \ 'colnum':    'GetColNum',
    \ 'percent':   'GetPercent',
    \ 'maxlines':  'GetMaxLines' },
  \ 'component_function_visible_condition': {
    \ 'modified':  0,
    \ 'pastemode': 0 },
  \ 'component_expand': {
    \ 'readonly': 'GetReadOnly' },
  \ 'component_type': {
    \ 'readonly': 'error' },
  \ 'mode_map': {
    \ 'n'      : 'N',
    \ 'i'      : 'I',
    \ 'R'      : 'R',
    \ 'v'      : 'V',
    \ 'V'      : 'L',
    \ "\<C-v>" : 'B',
    \ 'c'      : 'C',
    \ 's'      : 'S',
    \ 'S'      : 'E',
    \ "\<C-s>" : 'K',
    \ 't'      : 'T' }
\ }

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
set fillchars+=vert:│           " separator char(s) between vsplits
set diffopt+=vertical           " show diffs in vertical splits

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
" UNDO / REDO [gundo.vim]
"*******************************************************************************

let g:gundo_width = 80                        " width of gundo column
let g:gundo_preview_height = 15               " height of prev box in gundo col
let g:gundo_right = 1                         " put gundo col on far right

"*******************************************************************************
" CODE PROCESSING [cscope.vim]
"*******************************************************************************

let g:cscope_silent = 1                       " don't show cscope db update msg on save

"*******************************************************************************
" CODE SYNTAX [ale] [youcompleteme]
"*******************************************************************************

" enable processing of syntax file (file with highlighting rules for detected
" filetype), either from system .../syntax dir or ~/.config/vim/syntax
" syntax enable                 " keep user highlight color settings
" syntax on                     " override user setting with syntax file
" au FileType javascript : syntax on " selectively enable syntax file processing, only for certain file types

syntax enable

let g:ale_set_loclist = 1                                " use location list for warns/errs
let g:ale_echo_msg_warning_str = 'W'                     " str to use for warn severity
let g:ale_echo_msg_error_str = 'E'                       " str to use for err severity
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s' " in cmd bar, show full msg of curr line warn/err
let g:ale_echo_cursor = 1                                " in cmd bar, show short msg for nearest warn/err
let g:ale_sign_warning = '▬▶'                            " sign column warning symbol
let g:ale_sign_error = '▬▶'                              " sign column error symbol
let g:ale_statusline_format = ['E%d', 'W%d', '']

let g:ale_lint_on_enter = 1                   " lint when any buffer is first opened
let g:ale_lint_on_save = 1                    " lint when file is saved
let g:ale_lint_on_filetype_changed = 1        " lint when filetype changed
let g:ale_lint_on_text_changed = 'always'     " may be always, never, normal, insert
let g:ale_lint_delay = 1000                   " auto-lint delay for lint_on_text_changed

let g:ycm_show_diagnostics_ui = 0             " enable ycm linting

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
nnoremap I 0i
inoremap jj <Esc>

" VIM MODE / BEHAVIOR
"*******************************************************************************

nnoremap <leader>V :source $MYVIMRC<CR>

" NAVIGATION
"*******************************************************************************

nnoremap - $
vnoremap - $

" COPY / PASTE [vim-pasta]
"*******************************************************************************

nnoremap Y y$

" toggle paste mode with <F7>
set pastetoggle=<F7>
" copy visual-mode-selection to clipboard with CTRL-C
vnoremap <C-c> "+y
" paste from clipboard in insert mode with CTRL-V
inoremap <C-v> <F7><C-r>+<F7>

" CURSOR / LINE / COL HIGHLIGHTING [vim-indent-guides]
"*******************************************************************************

nnoremap <leader>i :IndentGuidesToggle<CR>

" LOCATION / QUICKFIX [cscope.vim]
"*******************************************************************************

nnoremap <silent> <leader>l :call ToggleLocationList()<CR>

" LINE / CHAR DISPLAY [rainbow]
"*******************************************************************************

" code folds open/close code with spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" rainbowparentheses toggle
nnoremap <leader>p :RainbowToggle<CR>

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
imap <silent> <C-l> <Plug>CapsLockToggle

" nerdcommenter: do not use default keymaps
let g:NERDCreateDefaultMappings = 0

" single-comment / uncomment selected lines
nmap <silent> <leader>cc <Plug>NERDCommenterToggle
vmap <silent> <leader>cc <Plug>NERDCommenterToggle

" verbose-block-comment selected lines
nmap <silent> <leader>cv <Plug>NERDCommenterSexy
vmap <silent> <leader>cv <Plug>NERDCommenterSexy

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
nnoremap <silent> <leader>T :NERDTreeToggle<CR>

" switch to nerdtree
nnoremap <silent> <leader>t :NERDTreeFocus<CR>

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
nnoremap <silent> <leader>f :CtrlP<CR>

" enter ctrl-p in open-buffers mode
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" enter ctrl-p in most-recently-used mode
nnoremap <silent> <leader>r :CtrlPMRU<CR>

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

" UNDO / REDO [gundo.vim]
"*******************************************************************************

nnoremap u :undo<CR>
nnoremap U :redo<CR>

nnoremap <silent> <leader>u :GundoToggle<CR>

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

" CODE SYNTAX [ale]
"*******************************************************************************

" go to next/previous warning or error
nnoremap <silent> <leader>. :ALENextWrap<CR>
nnoremap <silent> <leader>, :ALEPreviousWrap<CR>

" GIT INTEGRATION [vim-gitgutter]
"*******************************************************************************

" gitgutter: do not use default keymaps
let g:gitgutter_map_keys = 0

" gitgutter toggle
nnoremap <leader>gt :GitGutterToggle<CR>

" gitgutter view block as diff
nnoremap <leader>gv :GitGutterPreviewHunk<CR>

" gitgutter line highlight on/off
nnoremap <leader>gl :GitGutterLineHighlightsToggle<CR>

" gitgutter undo block of changes
nnoremap <leader>gu :GitGutterUndoHunk<CR>

" gitgutter goto next block of changes
nnoremap <leader>gg :GitGutterNextHunk<CR>

" gitgutter goto prev block of changes
nnoremap <leader>gb :GitGutterPrevHunk<CR>

" MISC
"*******************************************************************************

" display file file encoding and file format to the msg bar
nnoremap <leader>F :echo "FILE FORMAT:" &fileencoding "FILE ENCODING:" &fileformat<CR>

" keep weird stuff from happening
unmap <Enter>

