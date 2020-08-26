set undodir=$XDG_DATA_HOME/nvim/undo " Undohistory is stored in this dir
set directory=$XDG_DATA_HOME/nvim/swap " Here swap-files are saved preventing asynchronous editing
set backupdir=$XDG_DATA_HOME/nvim/backup " Backup files are stored here, in case you accidentally delete your file
set viewdir=$XDG_DATA_HOME/nvim/view " Don't know what this does lol
set runtimepath=$XDG_CONFIG_HOME/nvim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/rplugin/python3,$XDG_DATA_HOME/nvim/rplugin.vim,$XDG_CONFIG_HOME/nvim/after " This is the runtime-path where nvim looks to find plugins and other things
set autoread  " Update file upon change from outside vim buffer
set backup " Set backup
set undofile " Keep persistent undos when closing or switching buffers
set splitbelow splitright
set fcl=all
set noswapfile
set cmdheight=2
set ignorecase
set smartcase
set nohls
set noshowmatch
set number " turn on or off (number/nonumber)
set rnu " relative number wrt to current line (rnu/nornu)
set backspace=indent,eol,start
set guioptions=  " Disables scrollbar from macvim
set spelllang=en_gb
set textwidth=79 " wrap at 80 " Text width
set wrapmargin=2 " Actually wraps at 80+2
set colorcolumn=80 " show where 80 columns is
set nowrap " enable wrapping if window too small
set lbr " Makes a lbr for certain characters, can be disabled i think
set fo+=t " add text folding
set foldlevel=1
set ts=2 sw=2 et " Gives the tabstop spaces length, shiftwidth is the number of spaces for normal
" set shell=zsh\ -i

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'brennier/quicktex' 
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'dense-analysis/ale', {'for': ['python', 'tex', 'c', 'cpp']}
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-grepper'
Plug 'gruvbox-community/gruvbox'
call plug#end()


syntax on  " Turn on syntax highlighting
filetype plugin indent on  " Enable file type specific plugins and indentation

" Where is the neovim python located?
let g:python3_host_prog="/Users/mikevink/.dotfiles/virtualenvs/neovim_python/bin/python3"

" Choose your colors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
colorscheme gruvbox 

let g:semshi#mark_selected_nodes = 0

" Airline appearance
let g:airline_inactive_alt_sep=1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:airline_symbols_ascii = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Preview window always on?
let g:fzf_preview_window = 'right:60%'

" Floating window layout for fzf?
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" Spelling bindings and files
aug spelling_files
  au!
  au BufRead,BufNewFile *.tex setlocal spell " Spelling
  au BufRead,BufNewFile *.md setlocal spell " Spelling
aug END
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" Exit mode
inoremap kj <ESC>
" nnoremap <C-c> <ESC>
" nnoremap kj <esc>
vnoremap kj <ESC>

" Quick global substitute
nnoremap S :%s//g<Left><Left>
vnoremap s "syvap:s/\%V<c-r>s\%V//g<Left><Left>

" Leader key
let mapleader=" "
" let maplocalleader=","
" nnoremap , ,

" Change vim windows
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
noremap <leader>w= <C-w>=
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L
nnoremap <leader>wp <C-w>p
nnoremap <leader>wo <C-w>o
nnoremap <leader>wq <C-w>q

" Open and source vimrc
nmap <Leader>vrc :e $XDG_CONFIG_HOME/nvim/init.vim<CR>
nmap <Leader>vrs :source $XDG_CONFIG_HOME/nvim/init.vim<CR>

" Git status
nnoremap <leader>gs :G<CR>

" Git checkout fzf
nnoremap <leader>gc :GCheckout<cr>

" Merge conflict screen bindings
nnoremap <leader>gj :diffget \\3<CR>
nnoremap <leader>gf :diffget \\2<CR>

" Find currently open buffers
nmap <Leader>b :Buffers<CR>

" Find file in opened file history
nmap <Leader>fh :History<CR>

" Edit snippets file for filetype
nmap <Leader>fs :UltiSnipsEdit<CR>

" New markdown note in ~/Documents/markdown_notes/
nnoremap <leader>nn :NewNote<CR>

" Open index file of markdown_notes
nnoremap <leader>ni :vs $notes/index.md<CR>

" Allow vim to find tags file in current dir
set tags+=./tags;,tags

" Copy visual selection to the clipboard
vnoremap <leader>y "*y<CR>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <leader>q :cn<cr>
nmap <leader>gq :cp<cr>
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>ge :CocCommand explorer<CR>
nmap <silent> <leader>gg :GFiles<CR>
nnoremap <leader>cr :CocRestart

" Coc documentation jumper
nnoremap mm :call QuickFix_toggle(1)<CR>
nnoremap mM :call QuickFix_toggle(0)<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Dispatch show quickfix menu
function! QuickFix_toggle(disp)
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor

  if a:disp == 1
    Copen " from dispatch
  else
    if exists("b:vimtex")
      VimtexErrors
    else
      copen
    endif
  endif
endfunction


augroup maker
    autocmd!
    au BufRead,BufEnter *.tex setlocal makeprg=pdflatex\ -interaction=nonstopmode\ -output-directory=\'/Users/mike/.data/nvim/scratch_files/LaTeX/build\'\ %:S
    au BufRead,BufEnter *.cc setlocal makeprg=g++-10\ -o\ %:p:r\ %:p&&%:p:r
    au BufRead,BufEnter *.py setlocal makeprg=python\ %
augroup end

" Cellmode settings for finding tmux target (notebook like functionality)
let g:cellmode_use_tmux=1
let g:cellmode_tmux_sessionname='REPL'  " Will try to automatically pickup tmux session
let g:cellmode_tmux_windowname='REPL'
let g:cellmode_tmux_panenumber='1'

" Vim grepper arguments
let g:grepper = {
    \ 'tools': ['ag', 'ack', 'grep', 'findstr', 'rg', 'pt', 'git'],
    \ 'pt': {
    \   'grepprg':    'pt --nocolor --nogroup',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ }}

" Long settings files
" source $XDG_CONFIG_HOME/nvim/modules/vimtex.vim " Vimtex settings file
" source $XDG_CONFIG_HOME/nvim/modules/ale.vim
" source $XDG_CONFIG_HOME/nvim/modules/ultisnips.vim
" source $XDG_CONFIG_HOME/nvim/modules/quicktex.vim

" " Searching and managing my notes scripts
" source $XDG_CONFIG_HOME/nvim/modules/markdown.vim
