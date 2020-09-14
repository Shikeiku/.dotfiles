function! s:format_qf_line(line)
  let parts = split(a:line, ':')
  return { 'filename': parts[0]
         \,'lnum': parts[1]
         \,'col': parts[2]
         \,'text': join(parts[3:], ':')
         \ }
endfunction

function! s:qf_to_fzf(key, line) abort
  let l:filepath = expand('#' . a:line.bufnr . ':p')
  return l:filepath . ':' . a:line.lnum . ':' . a:line.col . ':' . a:line.text
endfunction

function! s:fzf_to_qf(filtered_list) abort
  let list = map(a:filtered_list, 's:format_qf_line(v:val)')
  if len(list) > 0
    call setqflist(list)
    copen
  endif
endfunction

command! FzfQF call fzf#run({
      \ 'source': map(getqflist(), function('<sid>qf_to_fzf')),
      \ 'down':   '20',
      \ 'sink*':   function('<sid>fzf_to_qf'),
      \ 'options': '--reverse --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all --prompt "quickfix> "',
      \ })

" Insert markdown link from library dic
function! s:vnnvFZF(lines) abort
  execute "normal! i![](".a:lines[0].")"
  execute "normal! 0f["
  call feedkeys('a')
endfunction



" fzf bindings for markdown
nnoremap <silent> <leader>nlt :call fzf#run({
                        \ 'source': 'python3 ~/Documents/python/vnnv/nvim_related/fzf.py',
                        \ 'sink*': function('vnnvFZF'),
                        \ 'down': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Tags> " --bind=alt-a:select-all,alt-d:deselect-all'})<CR>


nnoremap <silent> <leader>nll :call fzf#run({
                        \ 'source': 'find -LE ~/Documents/lib -regex ".*/.*"',
                        \ 'sink*': function('<sid>vnnvFZF'),
                        \ 'down': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Link> "'})<CR>

nnoremap <silent> <leader>nft :call fzf#run({
                        \ 'source': 'python3 ~/Documents/python/vnnv/nvim_related/fzf.py',
                        \ 'sink*': function('vnnvFZF'),
                        \ 'down': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Tags> " --bind=alt-a:select-all,alt-d:deselect-all'})<CR>

" Autocommands for markdown
aug markdown
  au!
  au BufNewFile,BufRead *.md imap <buffer> ;l <esc>:Start! vnnv read -lt data_mining lectures part1 lecture1 introduction<cr>
  " Invert latex fraction
  au BufNewFile,BufRead scratch.tex let @i = 'f}"0di{;di{"0P,""PB'
  " New display math section
  au BufNewFile,BufRead scratch.tex let @n = 'yap}p'
  " Open markdown link
  au BufNewFile,BufRead scratch.tex let @o = "yib:let @\" = substitute(@\", ' ', '\\ ', 'g') :!open <c-r>\""
aug END
