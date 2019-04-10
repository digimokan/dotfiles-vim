" use the normal vim dir that VIM uses: use VIM-installed plugins/ftplugins/etc.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" source the normal .vimrc that vim uses
" in .vimrc, specify neovim-only options with 'if has("nvim")'
source ~/.vimrc

