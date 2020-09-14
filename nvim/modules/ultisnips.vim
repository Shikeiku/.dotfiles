
" find local snippets in local Ultisnips folder
let g:UltiSnipsSnippetDirectories=["UltiSnips"]  

" Let's vim find local snippets in Ultisnips folder dir for example in the current-notes dir
set rtp+=~/Documents/LaTeX_notes/current-notes
set rtp+=~/Documents/markdown_notes
"
" Changes tabstop behavior

let g:ulti_expand_res = 0
function! Ulti_ExpandOrSpaceOrJump()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res
      return ''
  else
      let char_before_cursor = getline('.')[col(".")-2]
      if char_before_cursor == ' '
        try
          silent execute "normal! i\<BS>\<esc>:silent call search(\"<+.*+>\")\<CR>\"_c/+>/e\<CR>\<right>"
          return ''
        catch /.*/
          return "\<esc>la\<space>\<space>"
        endtry
        " call feedkeys("\<esc>\"_c/+>/e\<CR>")
      else
        " if pumvisible()
        "   call execute("normal! i\<Esc>")
        " endif
        if exists('g:quicktex_'.&ft)
          " call feedkeys("\<BS>\<C-r>=quicktex#expand#ExpandWord(\"".&ft."\")\<CR>")
          call execute("normal! i\<C-r>=quicktex#expand#ExpandWord(\"".&ft."\")\<CR>")
          return "\<right>"
        endif
        return ''
      endif
  endif
endfunction
 
        " call feedkeys("\<BS>\<C-r>=strpart(getline('.'), 0, col('.')-1)\<CR>")
          " silent execute "normal! Xi\<C-r>=strpart(getline('.'), 0, col('.')-1)\<CR>"
          " call feedkeys("\<BS>")
          " silent execute "normal! Ahello\<c-o>A"
aug expansion_files
  au!
  au BufEnter,BufRead *.md inoremap <silent> <buffer> <expr> <space> pumvisible() ? '<c-y><C-R>=Ulti_ExpandOrSpaceOrJump()<CR>' : '<C-R>=Ulti_ExpandOrSpaceOrJump()<CR>'
  au BufEnter,BufRead *.py inoremap <silent> <buffer> <expr> <space> pumvisible() ? '<c-y><C-R>=Ulti_ExpandOrSpaceOrJump()<CR>' : '<C-R>=Ulti_ExpandOrSpaceOrJump()<CR>'
aug END
" inoremap <silent> <space> <C-R>=Ulti_ExpandOrSpaceOrJump()<CR>




" let g:UltiSnipsJumpForwardTrigger = ';<space>' 

" let g:UltiSnipsJumpForwardTrigger = '<space><space>' 
" let g:UltiSnipsExpandTrigger = '<space>'  
" let g:UltiSnipsJumpForwardTrigger = '<space><space>' 
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>' 
let g:UltiSnipsListSnippets = '<c-tab>'

function! ListSnippets(findstart, base) abort
	if empty(UltiSnips#SnippetsInCurrentScope(1))
		return ''
	endif

    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && (line[start - 1] =~ '\a')
            let start -= 1
        endwhile
        return start
    else
        " find classes matching "a:base"
        let res = []
        for m in keys(g:current_ulti_dict_info)
            if m =~ a:base
				let n = {
					\ 'word': m,
					\ 'menu': '[snip] '. g:current_ulti_dict_info[m]['description']
					\ }
                call add(res, n)
            endif
        endfor
        return res
    endif
endfunction

au BufEnter *.py setlocal completefunc=ListSnippets
au BufEnter *.md setlocal completefunc=ListSnippets
au BufEnter *.Rmd setlocal completefunc=ListSnippets
au BufEnter *.cc setlocal completefunc=ListSnippets

imap <c-l> <c-x><c-u>
" imap <c-e> <esc><c-z>
" nmap <c-e> <esc><c-z>
