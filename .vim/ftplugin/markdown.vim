function! MarkdownLevel()
  if getline(v:lnum) =~ '^# .*$'
    return ">1"
  endif
"  if getline(v:lnum) =~ '^## .*$'
"    return ">2"
"  endif
  return "="
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr

