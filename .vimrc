"*******************************************************************************
" PLUGIN MANAGER (START BEFORE ANYTHING ELSE)
"*******************************************************************************

" global plugins (!= filetype plugins) are loaded automatically on vim start.
" either from system .../macros, $HOME/.vim/plugin, $HOME/.vim/autoload

" clone plugin manager to vim8 native plugin dir:
"   git clone https://github.com/kristijanhusak/vim-packager ${HOME}/.vim/pack/packager/opt/vim-packager

" launch vim and install plugins
"   vim +PackagerInstall

" load Packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#add('tpope/vim-abolish',                   { 'commit' : 'b95463a' })
  call packager#add('w0rp/ale',                            { 'tag'    : 'v2.5.0' })
  call packager#add('bkad/camelcasemotion',                { 'commit' : '406368d' })
  call packager#add('tpope/vim-capslock',                  { 'commit' : '6c5b03e' })
  call packager#add('tpope/vim-characterize',              { 'commit' : 'c6d26e5' })
  call packager#add('tpope/vim-commentary',                { 'commit' : '141d9d3' })
  if has('nvim')
    call packager#add('shougo/deoplete.nvim',              { 'tag'    : '5.1', 'do': ':UpdateRemotePlugins' })
  else
    call packager#add('shougo/deoplete.nvim',              { 'tag'    : '5.1' })
    call packager#add('roxma/nvim-yarp',                   { 'commit' : '83c6f4e' })
    call packager#add('roxma/vim-hug-neovim-rpc',          { 'commit' : '701ecbb' })
  endif
  call packager#add('shougo/echodoc.vim',                  { 'commit' : '42d0ac0' })
  call packager#add('tpope/vim-endwise',                   { 'commit' : 'f67d022' })
  call packager#add('tpope/vim-fugitive',                  { 'commit' : '80996c2' })
  call packager#add('junegunn/fzf',                        { 'tag'    : '0.18.0', 'dir': '~/.vim/vimplug/fzf', 'do': './install --bin' })
  call packager#add('junegunn/fzf.vim',                    { 'commit' : '359a80e' })
  call packager#add('mhinz/vim-grepper',                   { 'commit' : '4a47e20' })
  call packager#add('gruvbox-community/gruvbox',           { 'commit' : '79f0551' })
  call packager#add('ludovicchabant/vim-gutentags',        { 'commit' : '96cd7db' })
  call packager#add('machakann/vim-highlightedyank',       { 'commit' : '51e25c9' })
  call packager#add('yggdroot/indentline',                 { 'commit' : '80f4acd' })
  call packager#add('itchyny/lightline.vim',               { 'commit' : '83ae633' })
  call packager#add('maximbaz/lightline-ale',              { 'commit' : 'dd59077' })
  call packager#add('cohama/lexima.vim',                   { 'commit' : '54e647e' })
  call packager#add('wincent/loupe',                       { 'commit' : '050e152' })
  call packager#add('simnalamburt/vim-mundo',              { 'commit' : '43c4fb3' })
  call packager#add('scrooloose/nerdtree',                 { 'commit' : '7513f25', 'on' : ['NERDTree', 'NERDTreeToggle', 'NERDTreeFocus', 'NERDTreeFind'] })
  call packager#add('xuyuanp/nerdtree-git-plugin',         { 'commit' : '325a129', 'on' : ['NERDTree', 'NERDTreeToggle', 'NERDTreeFocus', 'NERDTreeFind'] })
  call packager#add('tpope/vim-obsession',                 { 'commit' : '95a5762' })
  call packager#add('kristijanhusak/vim-packager',         { 'commit':  'f862621', 'type': 'opt' })
  call packager#add('sickill/vim-pasta',                   { 'commit' : 'cb4501a' })
  call packager#add('sheerun/vim-polyglot',                { 'commit' : '3ddca5d' })
  call packager#add('tpope/vim-projectionist',             { 'commit' : 'e07013a' })
  call packager#add('romainl/vim-qf',                      { 'commit' : '4026bbc' })
  call packager#add('luochen1990/rainbow',                 { 'commit' : 'd08e167' })
  call packager#add('tpope/vim-repeat',                    { 'commit' : '43d2678' })
  call packager#add('kshenoy/vim-signature',               { 'commit' : '6bc3dd1' })
  call packager#add('mhinz/vim-signify',                   { 'commit' : 'ea87e05' })
  call packager#add('justinmk/vim-sneak',                  { 'commit' : '91192d8' })
  call packager#add('mhinz/vim-startify',                  { 'commit' : 'e25fbe1' })
  call packager#add('tpope/vim-surround',                  { 'commit' : '5970688' })
  call packager#add('machakann/vim-swap',                  { 'commit' : 'b8d636e' })
  call packager#add('wellle/targets.vim',                  { 'commit' : '4a5e9c0' })
  call packager#add('christoomey/vim-tmux-navigator',      { 'commit' : '9f7d158' })
  call packager#add('tmux-plugins/vim-tmux-focus-events',  { 'commit' : '48595bd' })
  call packager#add('sirver/ultisnips',                    { 'commit' : '6fdc364' })
endfunction

" Packager commands available on vim cmd line
command!       PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate  call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command!       PackagerClean   call PackagerInit() | call packager#clean()
command!       PackagerStatus  call PackagerInit() | call packager#status()

"*******************************************************************************
" VIM INIT
"*******************************************************************************

" clear all autocmds (autocmds loaded 2nd time when sourcing vimrc)
autocmd!

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
let g:startify_list_order = ['sessions', 'files', 'bookmarks', 'commands']
" custom start-menu-section titles
let g:startify_list_order = [
  \ ['   COMMANDS'], 'commands',
  \ ['   BOOKMARKS'], 'bookmarks',
  \ ['   SESSIONS'], 'sessions',
  \ ['   MRU FILES'], 'files'
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
let g:startify_bookmarks = ['$HOME/dotfiles/vim/.vimrc']

" max sessions to list in menu
let g:startify_session_number = 8

" max mru files to list in menu
let g:startify_files_number = 16
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

" save global .viminfo file
set viminfo='100                  " max files to store file-local marks for
set viminfo+=<50                  " max lines per global copy-paste register
set viminfo+=s10                  " max kbytes per global copy-paste registers
set viminfo+=/10                  " max global search-pattern-history
set viminfo+=h                    " disable highlight-prev-search on file load
set viminfo+=:100                 " max global cmd-line-history
if !has('nvim')                   " use .shada for nvim, use .viminfo for vim
  set viminfo+=n$HOME/.viminfo
else
  set viminfo+=n$HOME/.shada
endif

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
  silent execute ":normal \<Plug>(qf_loc_switch)"
  if (&filetype == 'qf')
    silent execute ":normal \<Plug>(qf_loc_toggle)"
    silent execute "wincmd p"
  else
    silent SignatureListBufferMarks
    let w:quickfix_title = 'signature_marks'
  endif
endfunction

" toggle marks window and window title
nnoremap <silent> <leader>m :call ToggleMarksWindow()<CR>

"*******************************************************************************
" BUFFERS
"*******************************************************************************

set nohidden                    " disable hidden (not visible, unsaved) bufs
set noconfirm                   " prompt when switching from unsaved buf

"*******************************************************************************
" SPLITS [vim-tmux-navigator]
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
" filetype), either from system ftplugin dir or $HOME/.vim/ftplugin
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
try
  colorscheme gruvbox                     " set colorscheme
  let g:gruvbox_invert_selection = 0      " shade vis sel (0), or reverse vid (1)
  let g:gruvbox_italic           = 1      " gruvbox enable italic text
  let g:gruvbox_contrast_dark    = 'soft' " gruvbox soft/medium/hard contrast
  let g:gruvbox_contrast_light   = 'soft' " gruvbox soft/medium/hard contrast
  let g:gruvbox_vert_split       = 'bg0'  " gruvbox vsplit sep col bg (│)
  let g:gruvbox_sign_column      = 'bg0'  " gruvbox sign col bg (signify/ale)
  let g:gruvbox_number_column    = 'bg0'  " gruvbox line numbers col bg
catch /^Vim\%((\a\+)\)\=:E185/
  silent !echo 'unable to find colorscheme file (have plugins been installed yet?)'
endtry

"*******************************************************************************
" CURSOR / LINE / COL HIGHLIGHTING [indentline]
"*******************************************************************************

set guicursor=a:block           " set neovim cursor style for all modes

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
" STATUSLINE [lightline] [lightline-ale]
"*******************************************************************************

set laststatus=2                     " always show status line above cmd buffer

function! GetMode()
  if (&filetype == 'qf' && exists('w:quickfix_title'))
    if (w:quickfix_title == 'global_search_window')
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
    return
      \ l:fname =~ 'mundo_' ? 'Undo Tree' :
      \ l:fname =~ 'diffpanel_' ? 'Undo Preview' :
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

function! GetObsession()
  if (winwidth(0) < 55)
    return ''
  elseif (&filetype == 'qf' && exists('w:quickfix_title'))
      return ''
  else
    let l:fname = expand('%:t')
    return
      \ l:fname =~ 'mundo_' ? '' :
      \ l:fname =~ 'diffpanel_' ? '' :
      \ l:fname =~ 'NERD_tree' ? '' :
      \ l:fname == 'Startify' ? '' :
      \ l:fname =~ 'keymaps.txt' ? '' :
      \ ObsessionStatus() == '[$]' ? 'Ⓢ' :
      \ ''
  endif
endfunction

function! GetFileName()
  let l:fname = expand('%:t')
  return
    \ l:fname =~ 'mundo_' ? '' :
    \ l:fname =~ 'diffpanel_' ? '' :
    \ l:fname =~ 'NERD_tree' ? '' :
    \ l:fname == 'Startify' ? '' :
    \ expand('%:t')
endfunction

function! GetReadOnly()
  let l:fname = expand('%:t')
  return
    \ l:fname == 'Startify'? '' :
    \ l:fname =~ 'NERD_tree'? '' :
    \ &readonly ? '╣ℝ╠' :
    \ ''
endfunction

function! GetModified()
  return &modified ? '╣+╠' : ''
endfunction

function! GetPasteMode()
  return &paste ? '╣ρ╠' : ''
endfunction

let g:lightline#ale#indicator_warnings = 'W '
let g:lightline#ale#indicator_errors = 'E '

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

function! s:getGruvColor(group)
  let l:guiColor = synIDattr(hlID(a:group), "fg", "gui")
  let l:termColor = synIDattr(hlID(a:group), "fg", "cterm")
  return [ l:guiColor, l:termColor ]
endfunction

let s:bg0    = s:getGruvColor('GruvboxBg0')
let s:bg1    = s:getGruvColor('GruvboxBg1')
let s:bg2    = s:getGruvColor('GruvboxBg2')
let s:bg3    = s:getGruvColor('GruvboxBg3')
let s:bg4    = s:getGruvColor('GruvboxBg4')
let s:fg0    = s:getGruvColor('GruvboxFg0')
let s:fg1    = s:getGruvColor('GruvboxFg1')
let s:fg2    = s:getGruvColor('GruvboxFg2')
let s:fg3    = s:getGruvColor('GruvboxFg3')
let s:fg4    = s:getGruvColor('GruvboxFg4')
let s:yellow = s:getGruvColor('GruvboxYellow')
let s:orange = s:getGruvColor('GruvboxOrange')
let s:red    = s:getGruvColor('GruvboxRed')
let s:blue   = s:getGruvColor('GruvboxBlue')
let s:green  = s:getGruvColor('GruvboxGreen')
let s:aqua   = s:getGruvColor('GruvboxAqua')
let s:purple = s:getGruvColor('GruvboxPurple')

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:bg0, s:fg3, 'bold' ], [ s:fg0, s:bg2 ] ]
let s:p.normal.middle   = [ [ s:fg2, s:bg1 ] ]
let s:p.normal.right    = [ [ s:bg0, s:fg3 ], [ s:fg3, s:bg2 ] ]
let s:p.normal.error    = [ [ s:red, s:bg1 ] ]
let s:p.normal.warning  = [ [ s:yellow, s:bg1 ] ]
let s:p.insert.left     = [ [ s:bg0, s:green, 'bold' ], [ s:fg0, s:bg2 ] ]
let s:p.insert.right    = [ [ s:bg0, s:green, 'bold' ], [ s:fg3, s:bg2 ] ]
let s:p.replace.left    = [ [ s:bg0, s:purple, 'bold' ], [ s:fg0, s:bg2 ] ]
let s:p.replace.right   = [ [ s:bg0, s:purple, 'bold' ], [ s:fg3, s:bg2 ] ]
let s:p.visual.left     = [ [ s:bg0, s:orange, 'bold' ], [ s:fg0, s:bg2 ] ]
let s:p.visual.right    = [ [ s:bg0, s:orange, 'bold' ], [ s:fg3, s:bg2 ] ]
let s:p.inactive.left   = [ [ s:bg0, s:bg4 ], [ s:bg0, s:bg3 ] ]
let s:p.inactive.middle = [ [ s:bg3, s:bg1 ] ]
let s:p.inactive.right  = [ [ s:bg0, s:bg4 ], [ s:bg4, s:bg2 ] ]
let s:p.tabline.left    = [ [ s:bg4, s:bg2 ] ]
let s:p.tabline.tabsel  = [ [ s:bg0, s:bg4 ] ]
let s:p.tabline.middle  = [ [ s:bg1, s:bg1 ] ]
let s:p.tabline.right   = copy(s:p.normal.right)

function! FlattenColorscheme(p) abort
  for k in values(a:p)
    for l in values(k)
      for m in range(len(l))
        let attr = ''
        if len(l[m]) == 3 && type(l[m][2]) == 1
          let attr = l[m][2]
        endif
        let l[m] = [l[m][0][0], l[m][1][0], l[m][0][1], l[m][1][1]]
        if !empty(attr)
          call add(l[m], attr)
        endif
      endfor
    endfor
  endfor
  return a:p
endfunction

let g:lightline#colorscheme#gruvbox_custom#palette = FlattenColorscheme(s:p)

let g:lightline = {
  \ 'colorscheme': 'gruvbox_custom',
  \ 'separator': {
    \ 'left':   '',
    \ 'right':  '' },
  \ 'subseparator': {
    \ 'left':  '│',
    \ 'right': '│' },
  \ 'active': {
    \ 'left':  [ [ 'mode', 'capslock' ],
               \ [ 'obsession', 'filename', 'readonly', 'modified', 'pastemode'],
               \ [ 'tagfunc' ] ],
    \ 'right': [ [ 'percent', 'maxlines' ],
               \ [ 'filetype', 'colnum' ],
               \ [ 'ale-errs', 'ale-warns' ] ] },
  \ 'inactive': {
    \ 'left':  [ [ 'mode', 'capslock' ],
               \ [ 'obsession', 'filename', 'readonly', 'modified', 'pastemode'],
               \ [ 'tagfunc' ] ],
    \ 'right': [ [ 'percent', 'maxlines' ],
               \ [ 'filetype', 'colnum' ] ] },
  \ 'component_function': {
    \ 'mode':      'GetMode',
    \ 'capslock':  'GetCapslock',
    \ 'obsession': 'GetObsession',
    \ 'filename':  'GetFileName',
    \ 'readonly':  'GetReadOnly',
    \ 'modified':  'GetModified',
    \ 'pastemode': 'GetPasteMode',
    \ 'filetype':  'GetFileType',
    \ 'colnum':    'GetColNum',
    \ 'percent':   'GetPercent',
    \ 'tagfunc':   'GetTagFunc',
    \ 'maxlines':  'GetMaxLines' },
  \ 'component_expand': {
    \ 'ale-warns': 'lightline#ale#warnings',
    \ 'ale-errs':  'lightline#ale#errors' },
  \ 'component_type': {
    \ 'ale-warns': 'warning',
    \ 'ale-errs':  'error' },
  \ 'component_function_visible_condition': {
    \ 'obsession': 0,
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
" FILE BROWSER [nerdtree] [nerdtree-git]
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
autocmd VimEnter * if argc() == 1 && !filereadable("Session.vim") && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if nerdtree is the only window left open
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
nnoremap <silent> <leader>t :silent NERDTreeFind<CR>

let g:NERDTreeMapToggleBookmarks = "b"        " show bookmarks view
let g:NERDTreeMapDeleteBookmark = "<Del>"     " delete the selected bookmark
let g:NERDTreeMapActivateNode = "l"           " expand dir or open file and switch to it
let g:NERDTreeMapOpenRecursively = "L"        " expand dir recursively
let g:NERDTreeMapOpenSplit = "x"              " open file in split and switch to it
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
let g:NERDTreeMapMenu = "o"                   " enter create/delete/move menu for selected file or parent dir

let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "~",
  \ "Staged"    : "✭",
  \ "Untracked" : "✚",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "~",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '-',
  \ "Unknown"   : "?"
\ }

"*******************************************************************************
" FILE FINDING / OPENING [fzf] [projectionist]
"*******************************************************************************

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_buffers_jump = 1      " jump to existing buf if possible

" enter fzf searching cwd files
nnoremap <silent> <leader>f :Files<CR>

" enter fzf searching most-recently-used working dir files
nnoremap <silent> <leader>r :History<CR>

" enter fzf searching source code tags
nnoremap <silent> <leader>b :Tags<CR>

" enter fzf searching git commits
nnoremap <silent> <leader>v :Commits!<CR>

" projectionist: invoke the defined 'alternate' cmd
nnoremap <silent> <leader>a :A<CR>

" projectionist: set global defaults (override with project .projections.json)
let g:projectionist_heuristics = {
  \ "*": {
    \ "*.h": {
      \ "alternate": [
        \ "{}.c",
        \ "{}.cpp"
      \ ]
    \ },
    \ "*.hpp": {
      \ "alternate": [
        \ "{}.cpp",
        \ "{}.hxx"
      \ ]
    \ },
    \ "*.c": {
      \ "alternate": "{}.h"
    \ },
    \ "*.cpp": {
      \ "alternate": [
        \ "{}.h",
        \ "{}.hpp"
      \ ]
    \ },
    \ "*.hxx": {
      \ "alternate": "{}.hpp"
    \ }
  \ }
\ }

"*******************************************************************************
" TEXT SEARCH / REPLACE [loupe] [abolish] [grepper] [gutentags] [qf]
"*******************************************************************************

" make vim internally use faster grep replacement utilities if available
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
elseif executable('sift')
    set grepprg=sift\ -nMs\ --no-color\ --binary-skip\ --column\ --no-group\ --git\ --follow
    set grepformat=%f:%l:%c:%m
elseif executable('ag')
    set grepprg=ag\ --vimgrep\
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
  silent execute ":normal \<Plug>(qf_qf_toggle)"
  if (expand('%:t') =~ 'NERD_tree')
    silent execute "wincmd p"
  elseif (&filetype == 'qf')
    let w:quickfix_title = 'global_search_window'
  endif
endfunction

let g:grepper = {}              " allow grepper options to be set
let g:grepper.tools = ['rg','ag','pt','ack','sift','git','grep','findstr'] " srch tool priority
let g:grepper.dir = 'cwd'       " srch in all files in vim cwd
let g:grepper.quickfix = 1      " use quickfix window for listing matches
let g:grepper.open = 1          " open quickfix after srch if at least 1 match
let g:grepper.switch = 1        " switch to quickfix after opening it
let g:grepper.jump = 0          " automatically jump to the first match
let g:grepper.prompt = 1        " prompt for search
let g:grepper.simple_prompt = 1 " show only srch tool name (not args) in prompt
let g:grepper.prompt_quote = 2  " wrap srch text in quotes (nullifies regex)
let g:grepper.highlight = 1     " highlight found matches

" search for word-under-cursor/visual-selection in any file within vim root dir
nnoremap sf :Grepper -cword -noprompt<CR>
xmap sf <plug>(GrepperOperator)
" xnoremap sf :<c-u>Grepper -noprompt -query '<,'> " part after query no work!
" search for input text in any file within vim root dir
nnoremap st :Grepper<CR>
" search for input text in current buffer
nnoremap sb :Grepper-buffer<CR>
" do batch replace on found searched text (operates on Quickfix lines)
nnoremap sr :cdo %S//ge \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" toggle search quickfix window
nnoremap <silent> <leader>s :call ToggleGlobalSearchWindow()<CR>
" go to next search line in quickfix list
nmap <silent> s. <Plug>(qf_qf_next)
" go to prev search line in quickfix list
nmap <silent> s, <Plug>(qf_qf_previous)

" update tags for vcs-dir files even if no buffer open (i.e. 'vim .')
let g:gutentags_generate_on_empty_buffer = 1

" go to word-under-cursor tag definition
nnoremap sd g<C-]>

"*******************************************************************************
" EDITING [capslock] [lexima] [endwise] [commentary] [swap]
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
" UNDO / REDO [mundo]
"*******************************************************************************

set undofile                    " enable persistent undos stored in a file
set undodir=$HOME/.vim/undos    " dir with files to store undos for each buf
set undolevels=10000            " max num undos in a buf that can be undone
set undoreload=100000           " num undos to save in undo file for each buf

let g:mundo_width = 60          " width of undotree split
let g:mundo_right = 1           " display undotree on right side
let g:mundo_help  = 1           " expand undotree help legend by default

nnoremap u :undo<CR>
nnoremap U :redo<CR>

nnoremap <silent> <leader>u :silent MundoToggle<CR>

"*******************************************************************************
" CODE SYNTAX [polyglot] [ale] [qf]
"*******************************************************************************

" enable processing of syntax file (file with highlighting rules for detected
" filetype), either from system .../syntax dir or $HOME/.config/vim/syntax
" syntax enable                 " keep user highlight color settings
" syntax on                     " override user setting with syntax file
" au FileType javascript : syntax on " selectively enable syntax file processing, only for certain file types

syntax enable

" polyglot language syntax settings
let g:vim_markdown_conceal = 0                " markdown: show wrapping _/*/etc
let g:tex_conceal = ''                        " markdown: show latex math
let g:vim_markdown_math = 1                   " markdown: show latex math
let g:vim_markdown_conceal_code_blocks = 0    " markdown: show code fences

" ale: general settings
let g:ale_set_loclist = 1                                " use location list for warns/errs
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

" ale: linters (override these in local vimrc's)
let g:ale_linters = {
  \ 'c':   ['clangtidy'],
  \ 'cpp': ['clangtidy']
\ }
let g:ale_c_parse_compile_commands = 1        " use cmake compile_commands.json if avail
let g:ale_c_clangcheck_options   = '-Wall -std=c11'
let g:ale_cpp_clangcheck_options = '-- -Wall -std=c++17'
let g:ale_c_clangtidy_options    = '-Wall -std=c11'
let g:ale_cpp_clangtidy_options  = '-Wall -std=c++17'
let g:ale_cpp_clangtidy_checks   = [
  \ '*,
  \ -cert-err58-cpp,
  \ -cppcoreguidelines-pro-type-vararg,
  \ -cppcoreguidelines-pro-bounds-array-to-pointer-decay,
  \ -google-readability-braces-around-statements,
  \ -fuchsia-default-arguments,
  \ -fuchsia-multiple-inheritance,
  \ -fuchsia-overloaded-operator,
  \ -hicpp-braces-around-statements,
  \ -hicpp-no-array-decay,
  \ -hicpp-vararg,
  \ -llvm-header-guard,
  \ -modernize-use-trailing-return-type,
  \ -readability-braces-around-statements'
\ ]
let g:ale_cmake_options           = '--linelength=180'
let g:ale_cmake_cmakelint_options = '--linelength=180'

" toggle ale window and set window title
function! g:ToggleAleWindow() abort
  silent ALELint
  silent execute ":normal \<Plug>(qf_loc_toggle)"
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
" AUTOCOMPLETION [deoplete] [echodoc]
"*******************************************************************************

set completeopt=menu                  " show completions in popup menu
set completeopt+=menuone              " show completions when only 1 match
set completeopt+=longest              " only show longest common match text

let g:deoplete#enable_at_startup = 1  " enable deoplete

let g:echodoc#enable_at_startup  = 1  " display function sigs from completion
if has('nvim')
  let g:echodoc#type = 'floating'
  highlight link EchoDocFloat Pmenu
else
  let g:echodoc#type = 'popup'
  highlight link EchoDocPopup Pmenu
endif

" select next/prev pop-up-menu completion entry
inoremap <silent> <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
inoremap <silent> <expr> <up>   pumvisible() ? "\<C-p>" : "\<up>"

"*******************************************************************************
" VCS SUPPORT [fugitive] [signify]
"*******************************************************************************

" next/prev diff when viewing side-by-side vimdifs
nnoremap <silent> <leader>j ]c
nnoremap <silent> <leader>k [c

" open interactive git status window
nnoremap <silent> <leader>g :Gstatus<CR>:resize 30<CR>
" open side-by-side git diff windows
nnoremap <silent> <leader>d :Gvdiff<CR>

" update on BufEnter, BufRead, BufReadPost, BufWritePost, WinEnter,
"   FocusGained, CursorHold, CursorHoldI
let g:signify_realtime = 1

" symbols for added/modified/removed lines
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = '≃'

" use green/orange/red gutter sign for added/modified/deleted lines
highlight link SignifySignAdd diffAdded
highlight link SignifySignChange diffFile
highlight link SignifySignDelete diffRemoved
highlight link SignifySignChangeDelete diffFile
highlight link SignifySignDeleteFirstLine diffRemoved

" signify goto next/prev block of changes
nmap <leader><right> <plug>(signify-next-hunk)
nmap <leader><left> <plug>(signify-prev-hunk)

" signify text object for block of changes
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

"*******************************************************************************
" MISC KEYMAPS
"*******************************************************************************

" switch to prev buffer - have to map enter key at end of maps!
nnoremap <CR> <C-^>

" open a copy of current file in another split
nnoremap <C-CR> :split<CR>

