"*******************************************************************************
" gvim-only settings
" --> loaded after normal .vimrc
"*******************************************************************************

"*******************************************************************************
" CURSOR / LINE / COL HIGHLIGHTING [vim-indent-guides]
"*******************************************************************************

" gvim only: cursor block/blink
if has ('gui_running')
  set guicursor+=a:block-Cursor
  set guicursor+=a:blinkon0
endif

"*******************************************************************************
" FONTS / COLORS
"*******************************************************************************

set guifont=Inconsolata\ 18       " gvim font (term vim uses vt font)

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


