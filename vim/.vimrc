set nocompatible               " be iMproved

filetype plugin indent on     " required!
syntax on

set nu 

set incsearch
set hlsearch

set encoding=utf-8
set gcr=n:blinkon0

set foldmethod=syntax
set foldlevelstart=1

set relativenumber

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

filetype plugin on

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

nmap	<C-]>	:NERDTreeToggle<CR>

"nmap <F8> :TagbarToggle<CR>


set omnifunc=syntaxcomplete#Complete

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

:nnoremap <F5> :buffers<CR>:buffer<Space>

let g:tex_flavor='latex'
let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"  " path to uncrustify configuration file


" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

autocmd BufNewFile,BufRead *.json set ft=javascript

noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

execute pathogen#infect()

autocmd Filetype haskell setlocal ts=2 sts=2 sw=2

"set rtp+=~/.local/powerline/powerline

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" let &colorcolumn=join(range(81,999),",")

set laststatus=2
set t_Co=256
set cryptmethod=blowfish2
colorscheme 256-grayvim
