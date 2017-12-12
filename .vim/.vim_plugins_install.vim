
""  Legenda "" za - abre o folder set nocompatible filetype off set guifont=Inconsolata\ for\ Powerline:h15 " Vundle and plug installers {{{
" Install Vundle plugin manager
let has_vundle=1
if !filereadable(expand("$HOME/.vim/bundle/Vundle.vim/autoload/vundle.vim"))
    echo "Installing Vundle..."
    echo ""
    if isdirectory(expand('$HOME/.vim/bundle')) == 0
        call mkdir(expand('$HOME/.vim/bundle'), 'p')
    endif
    execute 'silent !git clone https://github.com/gmarik/Vundle.vim.git "' . expand('$HOME/.vim/bundle/Vundle.vim') . '"'
    "execute 'silent !git clone https://github.com/gmarik/vundle "' . expand('$HOME/.vim/bundle/vundle') . '"'
    let has_vundle=0
    autocmd VimEnter * PluginInstall
endif

" Use pathogen if installed
if filereadable(expand("$HOME/.vim/bundle/vim-pathogen/autoload/pathogen.vim"))
  source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()
endif
"}}}

" Vundle Plugins {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

"Plugin List {{{
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'w0rp/ale'
Plugin 'leafgarland/typescript-vim'
call vundle#end()
runtime macros/matchit.vim
"}}}

" Syntastic options {{{
let g:syntastic_check_on_open=1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" Ariline options {{{
let g:airline#extensions#tabline#enabled = 1
let b:airline_whitespace_disabled = 1
"let g:airline#extensions#wordcount#enabled = 0
let g:airline_powerline_fonts = 1
let g:Powerlines_symbols = 'fancy'

" In X, we can use fancy colors and Unicode symbols
if &term =~ "xterm" || has ("gui_running")
  
" Define dict before settings symbols in it
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_theme='molokai'
else
 " let g:airline_theme='hybrid'
  let g:airline_left_sep                        = ' '
  let g:airline_right_sep                       = ' '
  let g:airline#extensions#tabline#left_sep     = ' '
  let g:airline#extensions#tabline#left_alt_sep = ' '
endif
"}}} 

filetype plugin indent on
"}}}
