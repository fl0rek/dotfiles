set nocompatible               " be iMproved

filetype plugin indent on     " required!
syntax on

set nu 

set encoding=utf-8
set gcr=n:blinkon0

set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML


set fillchars="fold: "
hi Folded ctermbg=Black ctermfg=darkyellow


inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

nmap <F8> :TagbarToggle<CR>

filetype plugin on

set omnifunc=syntaxcomplete#Complete
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"  " path to uncrustify configuration file


" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

autocmd BufNewFile,BufRead *.json set ft=javascript

:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

execute pathogen#infect()

autocmd Filetype haskell setlocal ts=2 sts=2 sw=2

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

let &colorcolumn=join(range(81,999),",")

set laststatus=2
set t_Co=256
colorscheme 256-grayvim
