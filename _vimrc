filetype plugin indent on
syntax on
set nobackup
set autoindent
set encoding=utf-8
set number
set incsearch
set ignorecase
set history=1000
set title
set showcmd
set laststatus=2
set hlsearch
set wildmenu
set showmatch
set showmode
set ruler
set hidden

"cursol for current line
set cursorline
"only current window.
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

set noerrorbells
set visualbell
set backspace=2
"Tabを空白何文字分に展開するか
set tabstop=8
"Tabを押した時に挿入される空白の量
set softtabstop=2
"define cindent/autoindent spaces(insert space automatically)
set shiftwidth=2
set textwidth=80

"行頭の余白内でTab打つとshiftwidth分インデントする
set smarttab
"replace Tab to Space
set expandtab
"新しい行を作った時に賢いインデントを行う
set smartindent

"Python config
autocmd FileType python set tabstop=8
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set textwidth=80
autocmd FileType python set smarttab
autocmd FileType python set expandtab
autocmd FileType python set nosmartindent
"Execution@Ctrl + @
function! s:Exec()
    exe "!" . &ft . " %"        
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-@> :call <SID>Exec()<CR>

"Gtags Config
map <C-i> :Gtags -f %<CR>
map <C-g> :GtagsCursor<CR>
"map <C-n> :cn<CR>
"map <C-p> :cp<CR>

"mode confirm from Colors.
autocmd InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
autocmd InsertLeave * hi StatusLine guifg=DarkGlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none

"buftabs config
let buftabs_in_statusline = 1

"bufexplorer shows help
let bufExplorerDetailedHelp = 1

"cursol is moved at last position.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 

"for arduino
autocmd BufNewFile,BufRead *.ino setf arduino

"for CUDA
au BufNewFile,BufRead *.cu set filetype=cu
au BufNewFile,BufRead *.cuh set filetype=cu

"for OpenCL
au BufNewFile,BufRead *.cl set filetype=cl

"for neocomplcache
let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"for grep.vim
command! -nargs=1 Gb :GrepBuffer 

"for eregex.vim
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?
let eregex_replacement=3

"for Align
let g:Align_xstrlen=3

"for Makefile
autocmd BufNewFile,BufRead Makefile setlocal noexpandtab
autocmd BufNewFile,BufRead makefile setlocal noexpandtab

"for NeoBundle
"use https: instead of git:
let g:neobundle_default_git_protocol='https'
filetype off

set nocompatible               " Be iMproved

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

"neocomp!!
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
"Unite!!!
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
"reference by vim
NeoBundle 'thinca/vim-ref'
"run program quickly
NeoBundle 'thinca/vim-quickrun'
"make Vim as C/C++ IDE
"NeoBundle 'vim-scripts/c.vim'
"Source code tagging
NeoBundle 'vim-scripts/gtags.vim'
"add good Colorscheme
NeoBundle 'vim-scripts/Lucius'
"grep from vim
NeoBundle 'grep.vim'
"yank manage
NeoBundle 'YankRing.vim'
"sudo by vim
NeoBundle 'sudo.vim'
"align char
NeoBundle 'smartchr'
"use ack command from vim
NeoBundle 'ack.vim'
"use ruby's regular expression
NeoBundle 'othree/eregex.vim'
"align Source code
NeoBundle 'vim-scripts/Align'
"ja-help docs
NeoBundle 'vim-jp/vimdoc-ja'


" Installation check.
NeoBundleCheck

"color settings
"set t_Co=256
"LuciusBlack
colorscheme zellner

filetype plugin indent on
