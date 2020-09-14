syntax on  " Turn on syntax highlighting
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
set spelllang=en_gb
set colorcolumn=80 " show where 80 columns is
highlight ColorColumn ctermbg=0 guibg=lightgrey
set nowrap " enable wrapping if window too small
set fo+=t " add text folding
set nofoldenable
set foldlevel=1
set ts=2 sw=0 et " Gives the tabstop spaces length, shiftwidth is the number of spaces for normaloisfdaiosjfd 
" Allow vim to find tags file in current dir
set tags+=./tags;,tags
set conceallevel=2 " conceal math things

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'SirVer/ultisnips'
Plug 'brennier/quicktex' 
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
call plug#end()

" Where is the neovim python located?
let g:python3_host_prog="/Users/mikevink/.dotfiles/virtualenvs/neovim_python/bin/python3"

" Choose your colors
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

set background=dark
colorscheme gruvbox-material 


" Language server stuff
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end
require'nvim_lsp'.pyls_ms.setup{on_attach=on_attach_vim}
EOF

lua require'nvim_lsp'.r_language_server.setup{ on_attach=require'completion'.on_attach }

" Diagnostic inline errors and symbol
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '

" Improved experience for markdown files
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set syntax=markdown.pandoc
augroup END

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

" FZF preview window always on?
let g:fzf_preview_window = 'right:60%'

" Floating window layout for fzf?
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" Vim grepper arguments
let g:grepper = {
    \ 'tools': ['ag', 'ack', 'grep', 'findstr', 'rg', 'pt', 'git'],
    \ 'pt': {
    \   'grepprg':    'pt --nocolor --nogroup',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ }}

" Markdown settings
let g:vim_markdown_folding_style_pythonic = 1
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:vim_markdown_follow_anchor = 1
let g:markdown_folding = 1

" Leader key
" let maplocalleader=","
" nnoremap , ,
let mapleader=" "

" Spelling bindings and files, ctrl-a to correct spelling
aug spelling_files
  au!
  au BufRead,BufNewFile *.tex setlocal spell " Spelling
  au BufRead,BufNewFile *.md setlocal spell " Spelling
aug END
inoremap <C-a> <c-g>u<Esc>[s1z=`]a<c-g>u

" Exit from insert to normal mode
inoremap kj <ESC>

" Quick global substitute
nnoremap S :%s//g<Left><Left>
vnoremap s "syvap:s/\%V<c-r>s\%V//g<Left><Left>

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

" Copy visual selection to the clipboard
vnoremap <leader>y "*y<CR>

" nvim lsp navigation
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader><c-n> :NextDiagnostic<CR>
nnoremap <silent> <leader><c-p> :PrevDiagnostic<CR>

" Quickfix list navigation
nmap <leader>q :cn<cr>
nmap <leader>gq :cp<cr>
nmap <silent> <leader>gxp :!open "dash://python3:<cword>"<cr> 
nmap <silent> <leader>gg :GFiles<CR>

" Coc documentation jumper
nnoremap mm :call QuickFix_toggle(1)<CR>
nnoremap mM :call QuickFix_toggle(0)<CR>

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

" Standard project make commands
augroup makers
  autocmd!
  au BufRead,BufEnter *.tex setlocal makeprg=pdflatex\ -interaction=nonstopmode\ -output-directory=\'/Users/mike/.data/nvim/scratch_files/LaTeX/build\'\ %:S
  au BufRead,BufEnter *.cc setlocal makeprg=g++-10\ -o\ %:p:r\ %:p&&%:p:r
  au BufRead,BufEnter *.py setlocal makeprg=python\ %
  au BufRead,BufEnter *.py nmap <buffer> <leader><cr> :w<cr>:Start -wait=always python3 %:p<CR>
  au BufRead,BufEnter *.py imap <buffer> ;u <c-x><c-u>
augroup end

" Long settings files for snippets and abbreviations and jumping
source $XDG_CONFIG_HOME/nvim/modules/ultisnips.vim
source $XDG_CONFIG_HOME/nvim/modules/quicktex.vim

" Vim portion of vnnv, need to package it sometime
source $XDG_CONFIG_HOME/nvim/modules/markdown.vim

