filetype plugin indent on
syntax on
set nocompatible
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
autocmd FileType python setl nosmartindent

"Gtags Config
map <C-g> :Gtags
map <C-i> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
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

"for neocomplcache
let g:neocomplcache_enable_at_startup = 1
"g:neocomplcache_snippets_dir='~/dotfiles/
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)


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

"for Makfile
autocmd BufNewFile,BufRead Makefile setlocal noexpandtab
autocmd BufNewFile,BufRead makefile setlocal noexpandtab

"for Vundle
filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git/
call vundle#rc()
"neocomp!!
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
"Unite!!!
Bundle 'Shougo/unite.vim'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'ujihisa/unite-font'
"reference by vim
Bundle 'thinca/vim-ref'
"run program quickly
Bundle 'thinca/vim-quickrun'
"make Vim as C/C++ IDE
Bundle 'vim-scripts/c.vim'
"Source code tagging
Bundle 'vim-scripts/gtags.vim'
"add good Colorscheme
Bundle 'vim-scripts/Lucius'
"grep from vim
Bundle 'grep.vim'
"yank manage
Bundle 'YankRing.vim'
"sudo by vim
Bundle 'sudo.vim'
"align char
Bundle 'smartchr'
"use ack command from vim
Bundle 'ack.vim'
"use ruby's regular expression
Bundle 'othree/eregex.vim'
"align Source code
Bundle 'vim-scripts/Align'
"ja-help docs
Bundle 'vim-jp/vimdoc-ja'

filetype plugin indent on

"color settings
set t_Co=256
colorscheme lucius
LuciusBlack
syntax on

