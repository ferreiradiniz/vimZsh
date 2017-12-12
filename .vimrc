" take comando que cria um diretorio e entra nele zsh
"set shell=/bin/zsh

set nocompatible        " use vim defaults

if filereadable(expand("$HOME/.vim/.vim_plugins_install.vim"))
	source $HOME/.vim/.vim_plugins_install.vim
endif

if filereadable(expand("$HOME/.vim/.plug_plugins.vim"))
	source $HOME/.vim/.plug_plugins.vim
endif


syntax on               "turn syntax highlighting on by default
set path+=** 		" search folder and subfolder
set wildmenu		" display all matching when tab complete

set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming
set history=200		" aumenta o historico de comandos de 20 para 200
set showcmd             " display incomplete commands
set relativenumber	" show line numbers
set ruler               " show the current row and column
set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present
set encoding=utf-8
set list
set listchars=tab:▸\ ,eol:¬    " give us nice EOL (end of line) characters
packadd! matchit

autocmd InsertEnter * call EndHighlight()

map n :call RepeatLastSearch()<CR>

function EndHighlight()
        match
            let s:lastsearch = @/
                nohlsearch
                    redraw
                endfunction

                function RepeatLastSearch()
                        exe "match Search /".s:lastsearch."/"
                            call search(s:lastsearch, "W")
                        endfunction

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should

" set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282


":imap <c-u> <esc>VU "uppercase

:let mapleader = ","
":nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
:inoremap jk <esc>
:vnoremap jk <esc>
":nnoremap <leader>d dd
":nnoremap <buffer>x dd
":set number numberwidth=1
":autocmd BufWritePre *.html :normal gg=G

" better backup, swap and undo storage {{{
set noswapfile
set backup
set undofile

set backupdir=~/.vim/dirs/backup
set undodir=~/.vim/dirs/undo
if !isdirectory(&backupdir)
	call mkdir(&backupdir, "p")
endif
if !isdirectory(&undodir)
	call mkdir(&undodir, "p")
endif
"}}}

set hidden
if has("autocmd")
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif

function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber & number
	else
		set nonumber & relativenumber
	endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

map <F9> mzgg=G`z

"Easy Expansion of the Active File Directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %% 
map <leader>ev :vsp %%
map <leader>et :tabe %%

set laststatus=2 	" first, enable status line always
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" ======= Config netrw ==============
let g:netrw_liststyle = 3	" change style
let g:netrw_banner = 0		" removing the banner
let g:netrw_browse_split = 2	" open files in a new vertical split
let g:netrw_winsize = 25	" set the width of directory explorer

"source $HOME/.vim/plugin/Statusline.vim

set timeoutlen=1000 ttimeoutlen=0

" Prettier configuration 
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG

" Type script config
autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

let g:typescript_compiler_options = '--noUnusedParameters --strictNullChecks'
hi ALEError term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
hi ALEStyleError term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

