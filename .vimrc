"*******************************************************************************
" PLUGIN MANAGER (START BEFORE ANYTHING ELSE)
"*******************************************************************************

" global plugins (!= filetype plugins) are loaded automatically on vim start.
" either from system .../macros, ~/.vim/plugin, ~/.vim/autoload

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
Plug 'jiangmiao/auto-pairs'
Plug 'ton/vim-bufsurf'
Plug 'bkad/camelcasemotion'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'maralla/completor.vim'
Plug 'ctrlpvim/ctrlp.vim', { 'on' : ['CtrlP', 'CtrlPMRU', 'CtrlPBuffer'] }
Plug 'tpope/vim-endwise'
Plug 'wincent/ferret'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sjl/gundo.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'romainl/vim-qf'
Plug 'wincent/loupe'
Plug 'scrooloose/nerdtree', { 'on' : ['NERDTree', 'NERDTreeToggle', 'NERDTreeFocus'] }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on' : ['NERDTree', 'NERDTreeToggle', 'NERDTreeFocus'] }
Plug 'tpope/vim-obsession'
Plug 'sickill/vim-pasta'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-repeat'
Plug 'kshenoy/vim-signature'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'sirver/ultisnips'
Plug 'wesq3/vim-windowswap'
Plug 'regedarek/zoomwin'

call plug#end()

"*******************************************************************************
" VIM INIT
"*******************************************************************************

" clear all autocmds (autocmds loaded 2nd time when sourcing vimrc)
autocmd!
" disable vi defaults and enable/allow vim-only features
set nocompatible

"*******************************************************************************
" LEADER KEY
"*******************************************************************************

" must go before all keybindings using leader!
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

"*******************************************************************************
" VIM CONFIG FILES
"*******************************************************************************

set secure exrc                 " source cwd .vimrc, but don't do dangerous cmds

" source this .vimrc file
nnoremap <silent> <leader>V :source $MYVIMRC<CR>:echo "global vimrc reloaded"<CR>

"*******************************************************************************
" TERMINAL BEHAVIOR
"*******************************************************************************

set ttimeoutlen=10              " keypress combo delay (speeds up some plugins)
set nolazyredraw                " don't redraw while executing macros/registers
set ttyfast                     " assume fast term connection; send more chars
set noerrorbells                " don't audible alert bells
set visualbell t_vb=            " don't visual alert bells

"*******************************************************************************
" AUTOREAD EVENTS [tmux-focus-events]
"*******************************************************************************

" fire CursorHold autocmd after still for XX ms (one time - not repeatedly!)
set updatetime=250
" allow buff reload if changed externally outside vim (but it's not automatic)
set autoread
" run checktime (check for ext buff chg) on focus chg, buff enter, still cursor
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" show warn msg after reloading buff from ext changes
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"*******************************************************************************
" VIM START SCREEN [startify]
"*******************************************************************************

" use unicode line-drawing in menu header
let g:startify_fortune_use_unicode = 1
" use indented, boxed random quote for menu header
let g:startify_custom_header = 'map(startify#fortune#boxed(), "\"   \".v:val")'

" start menu section order
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 'commands']
" custom start-menu-section titles
let g:startify_list_order = [
  \ ['   COMMANDS'], 'commands',
  \ ['   BOOKMARKS'], 'bookmarks',
  \ ['   SESSIONS'], 'sessions',
  \ ['   MRU FILES'], 'files',
  \ ['   CURRENT-DIR MRU FILES'], 'dir'
\ ]
" show 'edit new file' and 'quit' in menu
let g:startify_enable_special = 0
" use custom hotkeys for menu items (use numbers when out of hotkeys)
let g:startify_custom_indices = [
  \ 'D','d','f','l','w',
  \ 'r','x','c','m','u',
  \ 'o','g','y','h','n',
  \ 'p','a','z'
\ ]

" list of files for bookmarks section
let g:startify_bookmarks = ['~/dotfiles/vim/.vimrc']

" max sessions to list in menu
let g:startify_session_number = 8

" max mru files to list in menu
let g:startify_files_number = 8
" use relative paths when listing mru files
let g:startify_relative_path = 1
" list mru files from latest list of files from viminfo
let g:startify_update_oldfiles = 1
" when opening mru file, make vim change to its vcs root dir if available
let g:startify_change_to_vcs_root = 1
" else when opening mru file, make vim change to its dir
let g:startify_change_to_dir = 1
" do not show these files/patterns in mru files list
let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ 'vim_sessions/.*',
  \ '/usr/share/vim/.*/doc/.*',
  \ '.vimrc',
\ ]

"*******************************************************************************
" VIM SAVE-STATES [obsession]
"*******************************************************************************

" save global .viminfo file with
"   ' max files to store file-local marks for
"   < max lines per global copy-paste register
"   s max kbytes per global copy-paste registers
"   / max global search-pattern-history
"   h disable highlight-prev-search on loading file
"   : max global cmd-line-history
"   n specified viminfo file-path/name
set viminfo='100,<50,s10,/10,h,:100,n~/.viminfo

" use viminfo lastpos mark to open every file in last cursor pos
autocmd BufReadPost *
\ if ( line("'\"") > 1 ) && ( line("'\"" ) <= line("$") ) && ( &filetype !~# 'commit' )
  \ | exe "normal! g`\""
\ | endif

" save per-file autosave datafile for edited files
set noswapfile

set sessionoptions-=globals       " save global vars that start with leading cap
set sessionoptions+=options       " save global and local options and mappings
set sessionoptions-=localoptions  " save local options and mappings
set sessionoptions+=curdir        " save current working dir
set sessionoptions-=sesdir        " save Session.vim dir as working dir
set sessionoptions-=tabpages      " save extra tabs (always save 1st tab)
set sessionoptions+=blank         " save empty, unnamed splits
set sessionoptions+=help          " save help windows
set sessionoptions+=folds         " save manually-created & open/closed folds
set sessionoptions+=buffers       " save hidden and unloaded buffers
set sessionoptions+=winpos        " save position of main vim win
set sessionoptions+=resize        " save 'lines' and 'columns' of main vim win
set sessionoptions+=winsize       " save 'lines' and 'columns' of splits

" save current vim instance to session (Session.vim file)
nnoremap <silent> <leader>S :Obsession<CR>
" delete current session
nnoremap <silent> <leader>D :Obsession!<CR>

"*******************************************************************************
" HELP
"*******************************************************************************

function! g:OpenVimHelp() abort
  execute "silent vertical botright pedit $HOME/.vim/doc/keymaps.txt"
  silent! wincmd P
  execute "vertical resize 90"
endfunction

nnoremap <silent> <leader>/ :call OpenVimHelp()<CR>
nnoremap <silent> q :pclose<CR>

"*******************************************************************************
" MODE SWITCH
"*******************************************************************************

nnoremap ; :
nnoremap : ;
nnoremap I 0i
inoremap jj <Esc>

"*******************************************************************************
" NAVIGATION [camelcasemotion] [sneak]
"*******************************************************************************

set nostartofline               " go to start-of-line when navigating up/down

" make w/b/e/t respect camelcase/snakecase in all modes
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> \ <Plug>CamelCaseMotion_ge

" remove the just-mapped w/b/e/t mapping from select mode
sunmap w
sunmap b
sunmap e
sunmap \

nnoremap - $
vnoremap - $

" sneak forward/backward with fXX, FXX
map f <Plug>Sneak_s
map t <Plug>Sneak_S

let g:sneak#s_next = 1          " repeat just-invoked sneak with just f or F
let g:sneak#label = 1           " use label-mode (like vimfx) when 2+ matches
let g:sneak#target_labels = 'sftumnqSFGHLTUNRMQZ' " label-mode hotkeys
let g:sneak#use_ic_scs = 1      " 0 case sensitive, 1 use ignorecase/smartcase
let g:sneak#map_netrw = 0       " use sneak mappings in netrw buffers
let g:sneak#prompt = 'GOTO: '   " cmd bar prompt for the XX sneak letters

"*******************************************************************************
" MARKS [signature]
"*******************************************************************************

let g:SignatureMap = {
  \ 'Leader'            : 'm',
  \ 'PlaceNextMark'     : '',
  \ 'ToggleMarkAtLine'  : 'mt',
  \ 'PurgeMarksAtLine'  : '',
  \ 'DeleteMark'        : '',
  \ 'PurgeMarks'        : 'md',
  \ 'PurgeMarkers'      : '',
  \ 'GotoNextLineAlpha' : '',
  \ 'GotoPrevLineAlpha' : '',
  \ 'GotoNextSpotAlpha' : '',
  \ 'GotoPrevSpotAlpha' : '',
  \ 'GotoNextLineByPos' : 'm.',
  \ 'GotoPrevLineByPos' : 'm,',
  \ 'GotoNextSpotByPos' : '',
  \ 'GotoPrevSpotByPos' : '',
  \ 'GotoNextMarker'    : '',
  \ 'GotoPrevMarker'    : '',
  \ 'GotoNextMarkerAny' : '',
  \ 'GotoPrevMarkerAny' : '',
  \ 'ListBufferMarks'   : '',
  \ 'ListBufferMarkers' : ''
\ }

" marks to use (upper case letters are *global* marks)
let g:SignatureIncludeMarks = 'abcdefghijklmnopqrstuvwxyz'

" mark color
let g:SignatureMarkTextHL = 'SignatureMarkText'

" confirm PurgeMarks deletion of all marks
let g:SignaturePurgeConfirmation = 1

" toggle marks window and window title
function! g:ToggleMarksWindow() abort
  silent execute ":normal \<Plug>qf_loc_switch"
  if (&filetype == 'qf')
    silent execute ":normal \<Plug>qf_loc_toggle"
    silent execute "wincmd p"
  else
    silent SignatureListBufferMarks
    let w:quickfix_title = 'signature_marks'
  endif
endfunction

" toggle marks window and window title
nnoremap <silent> <leader>m :call ToggleMarksWindow()<CR>

"*******************************************************************************
" BUFFERS [bufsurf]
"*******************************************************************************

set nohidden                    " disable hidden (not visible, unsaved) bufs
set noconfirm                   " prompt when switching from unsaved buf

" switch to prev/next buffer opened in current pane
nnoremap <silent> <leader>h :BufSurfBack<CR>
nnoremap <silent> <leader>l :BufSurfForward<CR>

"*******************************************************************************
" SPLITS [vim-tmux-navigator] [windowswap] [zoomwin]
"*******************************************************************************

set splitbelow                  " create new splits below current one
set splitright                  " create new splits to right of current one
set fillchars+=vert:│           " separator char(s) between vsplits
set diffopt+=vertical           " show diffs in vertical splits

" navigate between splits
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>

" swap splits (vim native split-moves not reliable!)
let g:windowswap_map_keys = 0
nnoremap <silent> <leader>y :call WindowSwap#EasyWindowSwap()<CR>:echo 'window tagged for swap'<CR>

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

" save current split
nnoremap <silent> <leader>w :write<CR>:echo expand('%t') "saved"<CR>

" close current split
nnoremap <silent> <leader>q :quit<CR>

" quit all open splits
nnoremap <silent> <leader><Tab> :quitall<CR>

" zoom window: toggle fullscreen on current split
nnoremap <silent> <C-y> :ZoomWin<CR>
inoremap <silent> <C-y> <C-o>:ZoomWin<CR>

"*******************************************************************************
" QUICKFIX (global) / LOCLIST (per split) [qf]
"*******************************************************************************

let g:qf_mapping_ack_style = 1  " set up s/v/t/o/O/P qf hotkeys
let g:qf_auto_open_quickfix = 0 " open quickfix automatically if it's filled
let g:qf_auto_open_loclist = 0  " open loclist automatically if it's filled
let g:qf_auto_resize = 0        " auto-resize qf to num of list items
let g:qf_max_height = 10        " max qf window height
let g:qf_auto_quit = 1          " auto-quit vim if qf is the last window open
let g:qf_save_win_view = 0      " save view of curr window when switching to qf

" rebind global <CR> mapping to let <CR> open location-line in quickfix
autocmd BufReadPost quickfix nnoremap <silent> <buffer> <CR> <CR><C-w><C-p>

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

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " set vim-specific seqs for RGB colors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " set vim-specific seqs for RGB colors
set termguicolors                       " use truecolors in term (if vt support)
set background=dark                     " sel light/dark for some color schemes
colorscheme gruvbox                     " set colorscheme
let g:gruvbox_invert_selection = 0      " shade vis sel (0), or reverse vid (1)
let g:gruvbox_italic           = 1      " gruvbox enable italic text
let g:gruvbox_contrast_dark    = 'soft' " gruvbox soft/medium/hard contrast
let g:gruvbox_contrast_light   = 'soft' " gruvbox soft/medium/hard contrast
let g:gruvbox_vert_split       = 'bg0'  " gruvbox vsplit sep col bg (│)
let g:gruvbox_sign_column      = 'bg0'  " gruvbox sign col bg (gitgutter/ale)
let g:gruvbox_number_column    = 'bg0'  " gruvbox line numbers col bg

"*******************************************************************************
" CURSOR / LINE / COL HIGHLIGHTING [indentline]
"*******************************************************************************

set cursorline                  " shade active line (may slow term vim scroll!)
set colorcolumn=81              " set permanent colorschemed stripe down col 81

" only use cursorline for active, focused window
autocmd WinEnter,FocusGained * setlocal cursorline
autocmd WinLeave,FocusLost   * setlocal nocursorline

let g:indentLine_enabled = 1      " enable indent-lines
let g:indentLine_fileType = []    " whitelist enabled filetypes ([] is all)
let g:indentLine_fileTypeExclude = ['startify', 'nerdtree'] " blacklist enabled filetypes
let g:indentLine_bufNameExclude = [] " blacklist enabled buffer-names
let g:indentLine_char = '┊'       " char to use for 2nd-ith indent-lines
let g:indentLine_indentLevel = 10 " max num indent-lines
let g:indentLine_maxLines = 3000  " switch to diff algorithm at this num lines
let g:indentLine_faster = 0       " use faster algorithm (may be glitchy)

nnoremap <leader>I :IndentLinesToggle<CR>

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

" fold expand/collapse toggle
nnoremap <silent> , @=(foldlevel('.')?'za':"\<Space>")<CR>
" create fold in visual mode
vnoremap , zf

" display file encoding and file format to the msg bar
nnoremap <leader>F :echo "FILE FORMAT:" &fileencoding "FILE ENCODING:" &fileformat<CR>

"*******************************************************************************
" CMD BAR (BELOW STATUSLINE)
"*******************************************************************************

set cmdheight=1                 " make sure cmd line height stays at 1 line
set showcmd                     " show info about current cmd going on
set report=0                    " report on any # of lines changed (0 for always)
set noshowmode                  " don't show current mode (ins mode vs cmd mode)
set noruler                     " show current line and column number
set wildmenu                    " enable wildmenu tab-completing cmds :e <Tab>
set wildmode=list:longest       " set wildmenu to list choice

"*******************************************************************************
" STATUSLINE [lightline]
"*******************************************************************************

set laststatus=2                     " always show status line above cmd buffer

function! GetMode()
  if (&filetype == 'qf' && exists('w:quickfix_title'))
    if (w:quickfix_title == ':cgetexpr a:1')
      return 'Global Search'
    elseif (w:quickfix_title == 'linter_window')
      return 'Linter Errors'
    elseif (w:quickfix_title == 'signature_marks')
      return 'File Marks'
    else
      return ''
    endif
  else
    let l:fname = expand('%:t')
    return l:fname =~ '__Tagbar__' ? 'Source Map' :
      \ l:fname == 'ControlP' ? 'File Finder' :
      \ l:fname == '__Gundo__' ? 'Undo Tree' :
      \ l:fname == '__Gundo_Preview__' ? 'Undo Preview' :
      \ l:fname =~ 'NERD_tree' ? 'File Browser' :
      \ l:fname == 'Startify' ? 'Vim Start Menu' :
      \ winwidth(0) > 40 ? lightline#mode() :
      \ ''
  endif
endfunction

function! GetCapslock()
  if (CapsLockStatusline() != '')
    return 'CAPS'
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

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, flags, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

function! GetFileName()
  let l:fname = expand('%:t')
  return l:fname == 'ControlP'? g:lightline.ctrlp_item :
    \ l:fname =~ '__Tagbar__' ? '' :
    \ l:fname == '__Gundo__' ? '' :
    \ l:fname == '__Gundo_Preview__' ? '' :
    \ l:fname =~ 'NERD_tree' ? '' :
    \ l:fname == 'Startify' ? '' :
    \ expand('%t')
endfunction

function! GetReadOnly()
  let l:fname = expand('%:t')
  return l:fname == 'Startify'? '' :
    \ &readonly ? '╣ℝ╠' :
    \ ''
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

function! GetTagFunc()
  if (winwidth(0) > 125)
    return printf('%s', tagbar#currenttag('▶ %s', '', 'f'))
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
               \ [ 'tagfunc' ] ],
    \ 'right': [ [ 'percent', 'maxlines' ],
               \ [ 'filetype', 'colnum' ],
               \ [ 'ale' ] ] },
  \ 'inactive': {
    \ 'left':  [ [ 'mode', 'capslock' ],
               \ [ 'filename', 'readonly', 'modified', 'pastemode'],
               \ [ 'tagfunc' ] ],
    \ 'right': [ [ 'percent', 'maxlines' ],
               \ [ 'filetype', 'colnum' ],
               \ [ 'ale' ] ] },
  \ 'component_function': {
    \ 'mode':      'GetMode',
    \ 'capslock':  'GetCapslock',
    \ 'filename':  'GetFileName',
    \ 'readonly':  'GetReadOnly',
    \ 'modified':  'GetModified',
    \ 'pastemode': 'GetPasteMode',
    \ 'ale':       'GetAle',
    \ 'filetype':  'GetFileType',
    \ 'colnum':    'GetColNum',
    \ 'percent':   'GetPercent',
    \ 'tagfunc':   'GetTagFunc',
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
let NERDTreeHijackNetrw = 0                   " do not use netrw (messes up sessions)

" open nerdtree automatically if vim is used to open a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" refresh nerdtree on entering nerdtree window
function! NERDTreeRefresh()
    if &filetype == 'nerdtree'
        silent execute substitute(mapcheck('R'), '<CR>', '', '')
    endif
endfunction
autocmd BufEnter * call NERDTreeRefresh()

" toggle nerdtree window on/off
nnoremap <silent> T :silent NERDTreeToggle<CR>

" switch to nerdtree
nnoremap <silent> <leader>t :silent NERDTreeFocus<CR>

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

" function! s:fzf_delete_buffer(line)
  " echo a:line
  " bdelete 10
  " bdelete matchstr(line, "[0-9]*")
  " call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  " call map(a:lines, '{ bdelete v:val }')
  " copen
  " cc
" endfunction

let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" \ 'ctrl-q': function('s:fzf_delete_buffer'),

let g:ctrlp_match_window = 'min:1,max:10'     " min/max results-window height
let g:ctrlp_match_window_reversed = 0         " display results from top-to-bottom (need both!)
let g:ctrlp_match_window = 'order:ttb'        " display results from top-to-bottom (need both!)
let g:ctrlp_match_window = 'results:100'      " max results to display
let g:ctrlp_working_path_mode = 'w'           " search-root-dir = nerdtree-root
let g:ctrlp_switch_buffer = 'et'              " goto found file instead of opening new copy
let g:ctrlp_show_hidden = 1                   " search for hidden files

" make ctrlp use faster rg / ag if available
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

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
" TEXT SEARCH / REPLACE [loupe] [abolish] [ferret] [gutentags] [tagbar] [qf]
"*******************************************************************************

" make vim internally use faster grep replacement utilities if available
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
elseif executable('sift')
    set grepprg=sift\ -nMs\ --no-color\ --binary-skip\ --column\ --no-group\ --git\ --follow
    set grepformat=%f:%l:%c:%m
elseif executable('ag')
    set grepprg=ag\ --vimgrep\ --ignore=\"**.min.js\"
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ack')
    set grepprg=ack\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

set hlsearch                    " highlight previously searched expressions
set incsearch                   " highlight currently searched expr as you type
set ignorecase                  " ignore case in search patterns
set smartcase                   " with ignorecase, case-sensitive when uppercase encountered
set shortmess-=s                " suppress 'hit bottom' msg (+=s suppresses)

let g:LoupeCenterResults = 1    " center search text on screen
let g:LoupeVeryMagic = 0        " allow 'very-magic' (i.e. regexes) in srch text
let g:LoupeHighlightGroup = 'Error' " color of current target srch text

" go back to file-pos before search
nnoremap ' <C-O>
" clear all highlighted search text
nmap <leader>n <Plug>(LoupeClearHighlight)

" search and replace with abolish
nnoremap <leader>R :%S//g<Left><Left>

function! g:ToggleGlobalSearchWindow() abort
  silent execute ":normal \<Plug>qf_qf_toggle"
  if (expand('%:t') =~ 'NERD_tree')
    silent execute "wincmd p"
  elseif (&filetype == 'qf')
    let w:quickfix_title = ':cgetexpr a:1'
  endif
endfunction

" ferret: do not use default keymaps
let g:FerretMap = 0
" search for input text in any file within vim root dir (results in Quickfix)
nmap st <Plug>(FerretAck)
" search for word-under-cursor in any file within vim root dir (results in Qfix)
nmap sf <Plug>(FerretAckWord)
" do batch replace on found searched text (results in Quickfix)
nmap sr <Plug>(FerretAcks)
" toggle ferret quickfix window
nnoremap <silent> <leader>s :call ToggleGlobalSearchWindow()<CR>
" go to next search line in quickfix list
nmap <silent> s. <Plug>qf_qf_next
" go to prev search line in quickfix list
nmap <silent> s, <Plug>qf_qf_previous

" update tags for vcs-dir files even if no buffer open (i.e. 'vim .')
let g:gutentags_generate_on_empty_buffer = 1

" go to word-under-cursor tag definition
nnoremap sd g<C-]>

" toggle tag browser window on/off
nnoremap <silent> X :TagbarToggle<CR>
" switch to tag browser window
nnoremap <silent> <leader>x :TagbarOpen fj<CR>

let g:tagbar_map_openfold = "l"  " expand current nested tag
let g:tagbar_map_closefold = "h" " collapse current nested tag

"*******************************************************************************
" EDITING [capslock] [autopairs] [endwise] [commentary] [swap]
"*******************************************************************************

set backspace=2                 " allow backspacing over auto-indent/line-br/ins
set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines

" allow repeat indenting of visual selection
vnoremap > >gv
vnoremap < <gv

" go to end of line in insert mode
inoremap <C-e> <C-o>$

" toggle an insert-mode-only capslock
imap <silent> <C-l> <Plug>CapsLockToggle

" separator delimiters to work on
let g:AutoPairs = { '(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`' }
" insert matching space before ')' if '( ' typed in
let g:AutoPairsMapSpace = 1
" delete both stuck-together '()' when deleting the last ')' (breaks completor!)
let g:AutoPairsMapBS = 0
" open indented block on typing '(<CR>'
let g:AutoPairsMapCR = 1
" auto-center current line on screen when opening a block
let g:AutoPairsCenterLine = 0

" single-comment selected lines
nmap <silent> <leader>c gcc
vmap <silent> <leader>c gc

" swap-arg-under-cursor highlighting
highlight link SwapCurrentItem PmenuSbar

"*******************************************************************************
" SNIPPETS [ultisnips]
"*******************************************************************************

let g:UltiSnipsSnippetDirectories = ['snippet'] " define snippet dir in .vim dir
let g:UltiSnipsExpandTrigger = '<Tab>'          " expand completion menu snippet
let g:UltiSnipsJumpForwardTrigger = '<C-j>'     " go to next snippet field
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'    " go to prev snippet field

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
" COPY / PASTE [vim-pasta] [highlightedyank]
"*******************************************************************************

" copy to end of line
nnoremap Y y$

" highlight copied text
map y <Plug>(highlightedyank)
" highlight color for copied text
highlight link HighlightedyankRegion PmenuSbar
" highlighted-copied text stays lit for XX millisec (-1 for permanent)
let g:highlightedyank_highlight_duration = 7000

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

nnoremap <silent> <leader>u :silent GundoToggle<CR>

"*******************************************************************************
" CODE SYNTAX [ale] [qf]
"*******************************************************************************

" enable processing of syntax file (file with highlighting rules for detected
" filetype), either from system .../syntax dir or ~/.config/vim/syntax
" syntax enable                 " keep user highlight color settings
" syntax on                     " override user setting with syntax file
" au FileType javascript : syntax on " selectively enable syntax file processing, only for certain file types

syntax enable

let g:ale_set_loclist = 1                                " use location list for warns/errs
let g:ale_echo_msg_warning_str = 'W'                     " str to use for cmd bar warn severity
let g:ale_echo_msg_error_str = 'E'                       " str to use for cmd bar err severity
let g:ale_echo_msg_format = '%severity%: %s [%linter%]'  " in cmd bar, show full msg of curr line warn/err
let g:ale_echo_cursor = 1                                " in cmd bar, show short msg for nearest warn/err
let g:ale_sign_warning = '▬▶'                            " sign column warning symbol
let g:ale_sign_error = '▬▶'                              " sign column error symbol
let g:ale_statusline_format = ['E%d', 'W%d', '']         " text to show in statusline

let g:ale_lint_on_enter = 1                   " lint when any buffer is first opened
let g:ale_lint_on_save = 1                    " lint when file is saved
let g:ale_lint_on_filetype_changed = 1        " lint when filetype changed
let g:ale_lint_on_text_changed = 'always'     " may be always, never, normal, insert
let g:ale_lint_delay = 1000                   " auto-lint delay for lint_on_text_changed

" toggle ale window and set window title
function! g:ToggleAleWindow() abort
  silent ALELint
  silent execute ":normal \<Plug>qf_loc_toggle"
  if (expand('%:t') =~ 'NERD_tree')
    silent execute "wincmd p"
  elseif (&filetype == 'qf')
    silent execute 'sleep' 150 'm'
    let w:quickfix_title = 'linter_window'
  endif
endfunction

" toggle ale location-list window
nnoremap <silent> <leader>e :call ToggleAleWindow()<CR>
" show detailed linter msg for current error line
nmap <silent> E <Plug>(ale_detail)

" open first/last/prev/next nearest error/warning line in current buffer
nmap <silent> <leader>, <Plug>(ale_previous_wrap)
nmap <silent> <leader>. <Plug>(ale_next_wrap)

"*******************************************************************************
" AUTOCOMPLETION [completor]
"*******************************************************************************

set completeopt=menu                  " show completions in popup menu
set completeopt+=menuone              " show completions when only 1 match
set completeopt+=longest              " only show longest common match text
set completeopt+=preview              " show extra match info in prev window

let g:completor_clang_binary = '/usr/bin/clang'                  " C/C++ compl
let g:completor_blacklist = ['tagbar', 'qf', 'netrw', 'vimwiki'] " no compl for these ftypes
let g:completor_filesize_limit = 1024 " no compl when current buff fsize > XX MB
let g:completor_disable_ultisnips = 0 " complete from utilisnips (0/1/[ftypes])
let g:completor_disable_buffer = 0    " complete from ALL current buffs (0/1/ft)
let g:completor_disable_filename = 0  " complete filepaths from system (0/1/ft)
let g:completor_min_chars = 2         " min chars to trigger buff/snips compl
let g:completor_completion_delay = 80 " show pop-up-menu after xx millisec
let g:completor_refresh_always = 1    " refresh menu whenever key is pressed

" select next/prev pop-up-menu completion entry
inoremap <silent> <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
inoremap <silent> <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"
" backspace makes pop-up-menu disappear...this fixes it by invoking explicitly
inoremap <silent> <expr> <Bs> "\<Bs><C-R>=completor#do('complete')<CR>"

"*******************************************************************************
" VCS SUPPORT [fugitive] [gitgutter]
"*******************************************************************************

" next/prev diff when viewing side-by-side vimdifs
nnoremap <silent> ] ]c
nnoremap <silent> [ [c

" open interactive git status window
nnoremap <silent> <leader>g :Gstatus<CR>:resize 30<CR>
" open side-by-side git diff windows
nnoremap <silent> <leader>d :Gvdiff<CR>

" have gitgutter use system ripgrep / ag / grep in order of priority
if executable('rg')
  let g:gitgutter_grep_command = 'rg'
elseif executable('ag')
  let g:gitgutter_grep_command = 'ag'
elseif executable('ack')
  let g:gitgutter_grep_command = 'ack'
endif

" diff against index (default) or specific commit
let g:gitgutter_diff_base = 'HEAD'

" do not use default keymaps
let g:gitgutter_map_keys = 0

" symbols for added/modified/removed lines
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" use green/orange/red gutter sign for added/modified/deleted lines
highlight link GitGutterAdd diffAdded
highlight link GitGutterChange diffFile
highlight link GitGutterChangeDelete diffFile
highlight link GitGutterDelete diffRemoved

" gitgutter show block as diff
nnoremap <leader>vs :GitGutterPreviewHunk<CR>

" gitgutter undo block of changes
nnoremap <leader>vu :GitGutterUndoHunk<CR>

" gitgutter goto next block of changes
nnoremap <leader><right> :GitGutterNextHunk<CR>

" gitgutter goto prev block of changes
nnoremap <leader><left> :GitGutterPrevHunk<CR>

"*******************************************************************************
" MISC KEYMAPS
"*******************************************************************************

" switch to prev buffer - have to map enter key at end of maps!
nnoremap <CR> <C-^>

" open a copy of current file in another split
nnoremap <C-CR> :split<CR>

