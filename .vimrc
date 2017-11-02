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

Plug 'nacitar/a.vim'
Plug 'tpope/vim-abolish'
Plug 'w0rp/ale'
Plug 'bkad/camelcasemotion'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-characterize'
Plug 'maralla/completor.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'raimondi/delimitmate'
Plug 'wincent/ferret'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sjl/gundo.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'valloric/listtoggle', {'on':['LToggle','QToggle']}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on':['NERDTree','NERDTreeToggle','NERDTreeFocus']}
Plug 'xuyuanp/nerdtree-git-plugin', {'on':['NERDTree','NERDTreeToggle','NERDTreeFocus']}
Plug 'sickill/vim-pasta'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesq3/vim-windowswap'
Plug 'regedarek/zoomwin'

call plug#end()

"*******************************************************************************
" VIM INIT
"*******************************************************************************

" clear all autocommands. (if .vimrc is sourced twice, the auto-
" cmds will appear twice.  this starts clean slate.)
autocmd!

"*******************************************************************************
" LEADER KEY
"*******************************************************************************

" must go before all keybindings using leader!
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

"*******************************************************************************
" HELP
"*******************************************************************************

function! g:OpenVimHelp() abort
  execute "vertical botright pedit $HOME/.vim/doc/keymaps.txt"
  silent! wincmd P
  execute "vertical resize 90"
endfunction

nnoremap <silent> ? :call OpenVimHelp()<CR>
nnoremap <silent> q :pclose<CR>

"*******************************************************************************
" MAIN
"*******************************************************************************

set nocompatible                " disable vi defaults, and enable/allow vim-only features
set ttimeoutlen=10              " keypress combo delay (speeds up some plugins)
set nolazyredraw                " don't redraw while executing macros/registers
set ttyfast                     " assume fast term connection; send more chars
set noerrorbells                " don't audible alert bells
set visualbell t_vb=            " don't visual alert bells
set secure exrc                 " source cwd .vimrc, but don't do dangerous cmds

" fire CursorHold autocmd after XX ms
set updatetime=250
" allow buff reload if changed externally outside vim (but it's not automatic)
set autoread
" run checktime (check for ext buff chg) on focus chg, buff enter, still cursor
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" show warn msg after reloading buff from ext changes
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" source this .vimrc file
nnoremap <leader>V :source $MYVIMRC<CR>

"*******************************************************************************
" MODE SWITCH
"*******************************************************************************

nnoremap ; :
nnoremap : ;
nnoremap I 0i
inoremap jj <Esc>

"*******************************************************************************
" NAVIGATION [camelcasemotion]
"*******************************************************************************

" make w/b/e/t respect camelcase/snakecase in all modes
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> t <Plug>CamelCaseMotion_ge

" remove the just-mapped w/b/e/t mapping from select mode
sunmap w
sunmap b
sunmap e
sunmap t

nnoremap - $
vnoremap - $

"*******************************************************************************
" BUFFERS
"*******************************************************************************

set nohidden                    " disable hidden (not visble, unsaved) bufs
set noconfirm                   " prompt when switching from unsaved buf

"*******************************************************************************
" SPLITS [vim-tmux-navigator] [zoomwin]
"*******************************************************************************

set splitbelow                  " create new splits below current one
set splitright                  " create new splits to right of current one
set fillchars+=vert:│           " separator char(s) between vsplits
set diffopt+=vertical           " show diffs in vertical splits

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

"*******************************************************************************
" QUICKFIX (global) / LOCLIST (per split)
"*******************************************************************************

" must bind listtoggle plugin maps to something
let g:lt_location_list_toggle_map = '<leader><C-l>'
let g:lt_quickfix_list_toggle_map = '<leader><C-q>'

" open first/last/prev/next quickfix location-line in current buffer
nnoremap <silent> <leader>K :cfirst<CR>
nnoremap <silent> <leader>J :clast<CR>
nnoremap <silent> <leader>k :cprevious<CR>
nnoremap <silent> <leader>j :cnext<CR>

" open first/last/prev/next location-list location-line in current buffer
nnoremap <silent> <leader>< :lfirst<CR>
nnoremap <silent> <leader>> :llast<CR>
nnoremap <silent> <leader>, :lprevious<CR>
nnoremap <silent> <leader>. :lnext<CR>

" unbind global <CR> mapping to let <CR> open location-line in quickfix
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

"*******************************************************************************
" VIM SAVE FILES
"*******************************************************************************

" viminfo file stores session bufs/hist for next session ("viminfo=" disables)
set viminfo=

" vim swap files store autosave data for edited files...don't really need them
set noswapfile

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

nnoremap <leader>i :IndentGuidesToggle<CR>

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

" code folds open/close code with spacebar
nnoremap <silent> , @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap , zf

" rainbowparentheses toggle
nnoremap <leader>p :RainbowToggle<CR>

" display file encoding and file format to the msg bar
nnoremap <leader>F :echo "FILE FORMAT:" &fileencoding "FILE ENCODING:" &fileformat<CR>

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
" STATUSLINE [lightline]
"*******************************************************************************

set laststatus=2                     " always show status line above cmd buffer

function! GetMode()
  let l:fname = expand('%:t')
  return l:fname == 'ControlP' ? 'CtrlP' :
    \ l:fname == '__Gundo__' ? 'Gundo' :
    \ l:fname == '__Gundo_Preview__' ? 'Gundo Preview' :
    \ l:fname =~ 'NERD_tree' ? b:NERDTree.root.path.str() :
    \ winwidth(0) > 40 ? lightline#mode() : ''
endfunction

function! GetCapslock()
  if (CapsLockStatusline() != '')
    return 'CAPS'
  else
    return ''
endfunction

function! GetGitBranch()
  if (winwidth(0) > 80)
    if (fugitive#head() != '')
      return printf('☈ %s', fugitive#head())
    else
      return ''
    endif
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'GetCtrlPStatusMain',
  \ 'prog': 'GetCtrlPStatusProg'
\ }

function! GetCtrlPStatusMain(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! GetCtrlPStatusProg(str)
  return lightline#statusline(0)
endfunction

function! GetFileName()
  let l:fname = expand('%:t')
  return l:fname == 'ControlP'? g:lightline.ctrlp_item :
    \ l:fname == '__Gundo__' ? '' :
    \ l:fname == '__Gundo_Preview__' ? '' :
    \ l:fname =~ 'NERD_tree' ? '' :
    \ expand('%t')
endfunction

function! GetReadOnly()
  return &readonly ? '╣ℝ╠' : ''
endfunction

function! GetModified()
  return &modified ? '╣+╠' : ''
endfunction

function! GetPasteMode()
  return &paste ? '╣ρ╠' : ''
endfunction

function! GetAle()
  if (winwidth(0) > 55)
    return ALEGetStatusLine()
  else
    return ''
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
    return ''
  endif
endfunction

function! GetColNum()
  if (winwidth(0) > 70)
    return printf('%3dC', col('.'))
  else
    return ''
  endif
endfunction

function! GetPercent()
  if (winwidth(0) > 70)
    return printf( '%3d%%', float2nr(((line('.') * 1.0) / (line('$') * 1.0)) * 100) )
  else
    return ''
  endif
endfunction

function! GetMaxLines()
  if (winwidth(0) > 40)
    return printf('%d', line('$'))
  else
    return ''
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
    \ 'readonly':  'GetReadOnly',
    \ 'modified':  'GetModified',
    \ 'pastemode': 'GetPasteMode',
    \ 'ale':       'GetAle',
    \ 'filetype':  'GetFileType',
    \ 'colnum':    'GetColNum',
    \ 'percent':   'GetPercent',
    \ 'maxlines':  'GetMaxLines' },
  \ 'component_function_visible_condition': {
    \ 'readonly':  0,
    \ 'modified':  0,
    \ 'pastemode': 0 },
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
" FILE BROWSER [nerdtree]
"*******************************************************************************

let g:NERDTreeWinSize = 20                    " horizontal size of nerdtree
let g:NERDTreeMinimalUI = 1                   " do not show top help/info msg
let g:NERDTreeShowHidden = 1                  " show hidden files in the nerdtree
let g:NERDTreeChDirMode = 2                   " always set vim curr wkg dir to nerdtree base dir
let g:NERDTreeCascadeSingleChildDir = 0       " collapse dirs with single child
let g:NERDTreeAutoDeleteBuffer = 1            " using menu del, del matching buff of file

" open nerdtree automatically if vim is used to open a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
let g:NERDTreeMapCloseChildren = "H"          " close selected dir and subdirs recursively
let g:NERDTreeMapJumpNextSibling = "J"        " move to next dir in current level
let g:NERDTreeMapJumpPrevSibling = "K"        " move to previous dir in current level
let g:NERDTreeMapJumpParent = "u"             " move to parent dir
let g:NERDTreeMapJumpRoot = "U"               " move to nerdtree-root-dir
let g:NERDTreeMapChangeRoot = "c"             " make parent dir of curr pos the nerdtree-root-dir
let g:NERDTreeMapUpdirKeepOpen = "C"          " make the nerdtree-root-dir go up one dir
let g:NERDTreeMapRefresh = "r"                " refresh listing of parent dir of curr pos
let g:NERDTreeMapRefreshRoot = "R"            " refresh listing of nerdtree-root-dir recursively
let g:NERDTreeMapMenu = "m"                   " enter create/delete/move menu for selected file or parent dir

"*******************************************************************************
" FILE FINDING / OPENING [ctrlp] [a]
"*******************************************************************************

let g:ctrlp_match_window = 'min:1,max:10'     " min/max results-window height
let g:ctrlp_match_window_reversed = 0         " display results from top-to-bottom (need both!)
let g:ctrlp_match_window = 'order:ttb'        " display results from top-to-bottom (need both!)
let g:ctrlp_match_window = 'results:100'      " max results to display
let g:ctrlp_working_path_mode = 'w'           " search-root-dir = nerdtree-root
let g:ctrlp_switch_buffer = 'et'              " goto found file instead of opening new copy
let g:ctrlp_show_hidden = 1                   " search for hidden files

" enter ctrl-p in file-search mode
nnoremap <silent> <leader>f :CtrlP<CR>

" enter ctrl-p in open-buffers mode
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" enter ctrl-p in most-recently-used mode
nnoremap <silent> <leader>r :CtrlPMRU<CR>

" ctrl-p search window bindings
let g:ctrlp_prompt_mappings = {
  \ 'ToggleRegex()':   ['<c-r>'],
  \ 'ToggleByFname()': ['<c-d>'],
  \ 'ToggleType(1)':   ['<tab>'],
  \ 'PrtExit()':       ['<home>', '<end>', '<esc>']
\ }

" a.vim: alternate between .c file and .h file
nnoremap <silent> <leader>a :A<CR>

"*******************************************************************************
" TEXT SEARCH / REPLACE [abolish] [ferret] [gutentags] [listtoggle]
"*******************************************************************************

set nohlsearch                  " don't highlight previously searched expressions
set incsearch                   " highlight currently searched expressions
set matchtime=5                 " blink matching chars for .x seconds
set completeopt=menu,longest,preview " ins mode autocomplete <Ctrl>-P options
set nostartofline               " don't go to start-of-line when <Ctrl>-d/u/f/b

" search and replace with abolish
nnoremap <leader>R :%S/

" ferret: do not use default keymaps
let g:FerretMap = 0
" search for input text in any file within vim root dir (results in Quickfix)
nmap <leader>st <Plug>(FerretAck)
" search for word-under-cursor in any file within vim root dir (results in Qfix)
nmap <leader>sf <Plug>(FerretAckWord)
" do batch replace on found searched text (results in Quickfix)
nmap <leader>sr <Plug>(FerretAcks)
" toggle ferret quickfix window
nnoremap <silent> <leader>ss :QToggle<CR>:TmuxNavigatePrevious<CR>

" update tags for vcs-dir files even if no buffer open (i.e. 'vim .')
let g:gutentags_generate_on_empty_buffer = 1

" go to word-under-cursor tag definition
nnoremap <leader>sd g<C-]>

"*******************************************************************************
" EDITING [capslock] [delimitmate] [nerdcommenter]
"*******************************************************************************

set backspace=2                 " allow backspacing over auto-indent/line-br/ins
set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines

" toggle an insert-mode-only capslock
imap <silent> <C-l> <Plug>CapsLockToggle

let g:delimitMate_autoclose = 1              " automatically add closing delims
let g:delimitMate_matchpairs = "(:),[:],{:}" " separator-delimiters to work on
let g:delimitMate_quotes = "\" ' `"          " quote-delimiters to work on
let g:delimitMate_nesting_quotes = ['"','`'] " make typing ''' do ''''''
let g:delimitMate_expand_cr = 1              " expand <CR> after ' and balance
let g:delimitMate_expand_space = 1           " expand spc after ' and balance
let g:delimitMate_expand_inside_quotes = 0   " use expand CR/space inside quotes
let g:delimitMate_jump_expansion = 0         " jmp ovr CR/spc exp on ins cls prs
let g:delimitMate_balance_matchpairs = 0     " auto-balance matching pairs
let g:delimitMate_excluded_regions = "Comment" " turn off DLM in certain regions
let g:delimitMate_excluded_ft = "mail,txt"   " turn off DLM in certain filetypes

" nerdcommenter: do not use default keymaps
let g:NERDCreateDefaultMappings = 0

" single-comment / uncomment selected lines
nmap <silent> <leader>cc <Plug>NERDCommenterToggle
vmap <silent> <leader>cc <Plug>NERDCommenterToggle

" verbose-block-comment selected lines
nmap <silent> <leader>cv <Plug>NERDCommenterSexy
vmap <silent> <leader>cv <Plug>NERDCommenterSexy

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
set preserveindent              " if tabbing onto existing indent, keep existing

"*******************************************************************************
" COPY / PASTE [vim-pasta]
"*******************************************************************************

" highlighted-copied text stays lit for XX millisec (-1 for permanent)
let g:highlightedyank_highlight_duration = -1

nnoremap Y y$

" highlight copied text
map y <Plug>(highlightedyank)

" toggle paste mode with <F7>
set pastetoggle=<F7>
" copy visual-mode-selection to clipboard with CTRL-C
vnoremap <C-c> "+y
" paste from clipboard in insert mode with CTRL-V
inoremap <C-v> <F7><C-r>+<F7>

"*******************************************************************************
" UNDO / REDO [gundo]
"*******************************************************************************

set undofile                    " enable persistent undos stored in a file
set undodir=$HOME/.vim/undos    " dir with files to store undos for each buf
set undolevels=10000            " max num undos in a buf that can be undone
set undoreload=100000           " num undos to save in undo file for each buf

let g:gundo_width = 80                        " width of gundo column
let g:gundo_preview_height = 15               " height of prev box in gundo col
let g:gundo_right = 1                         " put gundo col on far right

nnoremap u :undo<CR>
nnoremap U :redo<CR>

nnoremap <silent> <leader>u :GundoToggle<CR>

"*******************************************************************************
" CODE SYNTAX [ale] [completor] [listtoggle]
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

let g:completor_clang_binary = '/usr/bin/clang'                  " C/C++ compl
let g:completor_blacklist = ['tagbar', 'qf', 'netrw', 'vimwiki'] " no compl for these ftypes
let g:completor_filesize_limit = 1024 " no compl when current buff fsize > XX MB
let g:completor_disable_ultisnips = 1 " complete from utilisnips (0/1/[ftypes])
let g:completor_disable_buffer = 0    " complete from ALL current buffs (0/1/ft)
let g:completor_disable_filename = 0  " complete filepaths from system (0/1/ft)
let g:completor_min_chars = 2         " min chars to trigger buff/snips compl
let g:completor_completion_delay = 80 " show pop-up-menu after xx millisec
let g:completor_refresh_always = 1    " refresh menu whenever key is pressed

" toggle ale location-list window
nnoremap <silent> <leader>e :LToggle<CR>
" show detailed linter msg for current error line
nnoremap <silent> <leader>E :ALEDetail<CR>

" select first/next pop-up-menu completion entry
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
" select prev pop-up-menu completion entry
inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"
" backspace makes pop-up-menu disappear...this fixes it by invoking explicitly
inoremap <expr> <Bs> "\<Bs><C-R>=completor#do('complete')<CR>"

"*******************************************************************************
" VCS SUPPORT [gitgutter]
"*******************************************************************************

" diff against index (default) or specific commit
let g:gitgutter_diff_base = 'HEAD'

" gitgutter: do not use default keymaps
let g:gitgutter_map_keys = 0

" gitgutter show block as diff
nnoremap <leader>vs :GitGutterPreviewHunk<CR>

" gitgutter undo block of changes
nnoremap <leader>vu :GitGutterUndoHunk<CR>

" gitgutter goto next block of changes
nnoremap <leader>vv :GitGutterNextHunk<CR>

" gitgutter goto prev block of changes
nnoremap <leader>vc :GitGutterPrevHunk<CR>

"*******************************************************************************
" KEYMAPS
"*******************************************************************************

" [mapkeyword] [fromkeys] [tokeys]
" map Q j        ...If j mapped to anything, map calls that j map recursively
" noremap Q j    ...Just map Q to j, and ignore any j mappings that exist
" [n/i/v]noremap ...Apply the map to edit mode (n), ins mode (i), vis mode (v)

" MISC
"*******************************************************************************

" switch to prev buffer - have to map enter key at end of maps!
nnoremap <CR> <C-^>

