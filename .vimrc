execute pathogen#infect()
syntax on
filetype plugin indent on
filetype plugin on

set t_Co=256
set background=dark

" Override search term color
hi Search cterm=None ctermbg=055

set mouse=a
set clipboard=unnamed
set hlsearch
set cursorline

" Basic formatting stuff
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Python specific
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufWritePre *.py :%s/\s\+$//e

" YAML specific
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Go specific
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command = "gopls"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" File widths
au BufNewFile,BufRead *.py set colorcolumn=80
au BufNewFile,BufRead *.go set colorcolumn=120 |
    \ set textwidth=120
au BufNewFile,BufRead *.md set colorcolumn=120 |
    \ set textwidth=120

" FZF find file
set rtp+=~/.fzf
nnoremap <C-p> :Files<Cr>
