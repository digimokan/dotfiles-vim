" Config Settings For Editing 'Mail' File Types
" Use setlocal To Contain Settings To Current Buffer/Window Only

" Set Text Width Of Buffer To 72 Chars
setlocal tw=72

" Set Vim Format Option - Auto-Format Paragraphs By Default
setlocal fo+=a

" Set Vim Format Option - If Trailing Whitesp, Continue Para On Next Line
setlocal fo+=w

" Use These Cmds To Edit Mutt Msg Hdr Lines (Disabling Auto-Format)
nnoremap aa :setlocal fo-=a<CR>a
nnoremap AA :setlocal fo-=a<CR>A
nnoremap ii :setlocal fo-=a<CR>i

" Normal Ins-Mode Cmds To Edit Mutt Msg Body (Enable Or Re-Enable Auto-Format)
nnoremap a :setlocal fo+=a<CR>a
nnoremap A :setlocal fo+=a<CR>A
nnoremap i :setlocal fo+=a<CR>i
nnoremap I :setlocal fo+=a<CR>0i
nnoremap r :setlocal fo+=a<CR>r
nnoremap R :setlocal fo+=a<CR>R
nnoremap o :setlocal fo+=a<CR>o
nnoremap O :setlocal fo+=a<CR>O
nnoremap v :setlocal fo+=a<CR>v
nnoremap V :setlocal fo+=a<CR>V

" Customize Vim Startup Actions For New Emails, Replies, Forwards, Etc
function CustomMsgTypeActions()
    " If Composing New Email, Start In Ins Mode Two Lines Past Headers
    if line('$') < 8
        :$
        :put! =\"\n\"
        :$
        :startinsert
    endif
endfunction
autocmd! VimEnter /tmp/mutt* :call CustomMsgTypeActions()

