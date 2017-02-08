" disable vi compatibility mode
set nocompatible 

" PLUGINS
call plug#begin('~/.vim/plugged')

"Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'

"Unite
" depends on vimproc
" you have to go to .vim/plugin/vimproc.vim and do `make`
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimproc.vim'

" current word highlighting
Plug 'ihacklog/HiCursorWords'

"Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'

"Git related plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Search in files with ag
Plug 'rking/ag.vim'

call plug#end()

" CONFIG

" Set colours to solarized or fallback to installed theme
set background=dark
set t_Co=256

colorscheme 256-grayvim

if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=9
endif

let g:unite_source_history_yank_enable = 1
try
	let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
	call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr>:<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
nnoremap <space>r <Plug>(unite_restart)

nnoremap <space>/ :Ag 

" filetype and syntax highlighting
filetype plugin indent on
filetype plugin on
syntax on

" show current number and relative offset for rest 
set number
set relativenumber

" highlighing and incremental search while typing
set incsearch
set hlsearch

" set encoding
set encoding=utf-8

" ???
set gcr=n:blinkon0


" Folding specific configuration
set foldmethod=syntax
"set foldlevelstart=1

let javaScript_fold=1		" JavaScript
let perl_fold=1			" Perl
let php_folding=1		" PHP
let r_syntax_folding=1		" R
let ruby_fold=1			" Ruby
let sh_fold_enabled=1		" sh
let vimsyn_folding='af'		" Vim script
let xml_syntax_folding=1	" XML

set fillchars="fold: "
hi Folded ctermbg=Black ctermfg=darkyellow


" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" CtrlP configuration
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"search from project root or else from current directory
let g:ctrlp_working_path_mode = 'ra'


"print buffers on f5 and prompt for buffer to switch to
nnoremap <F5> :buffers<CR>:buffer<Space>

"use latex for tex files 
let g:tex_flavor='latex'


" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

"use js syntax for json
autocmd BufNewFile,BufRead *.json set ft=javascript

"vertical split current file 
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR> 

nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'


"haskell specific indentation configuration
autocmd Filetype haskell setlocal ts=2 sts=2 sw=2


"setup powerline
"set rtp+=~/.local/powerline/powerline
if has('python3')
	python3 from powerline.vim import setup as powerline_setup
	python3 powerline_setup()
	python3 del powerline_setup
endif

set laststatus=2
"make vim file encryption more secure (probably won't use it anyway, but hey)
set cryptmethod=blowfish2
