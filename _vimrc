filetype plugin indent on
syntax on
set nocompatible
set nobackup
set encoding=utf-8
set autoindent
set number
set incsearch
set ignorecase
set history=100
set title
set showcmd
set laststatus=2
set hlsearch
set wildmenu
set showmatch
set showmode
set ruler
set hidden
"http://d.hatena.ne.jp/hebita164/20100606/1275799679

set noerrorbells
set tabstop=8
set backspace=4
set softtabstop=4
set shiftwidth=2
set textwidth=80
set smarttab
set expandtab
set smartindent
"Python config
autocmd FileType python set tabstop=8
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set textwidth=80
autocmd FileType python set smarttab
autocmd FileType python set expandtab
autocmd FileType python set nosmartindent
"Execution@Ctrl + P
function! s:Exec()
    exe "!" . &ft . " %"        
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>

"colorscheme evening
"Gtags Config
map <C-g> :Gtags
map <C-i> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
"map <C-n> :cn<CR>
"map <C-p> :cp<CR>

"mode confirm from Colors.
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=DarkGlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none

"buftabs config
let buftabs_in_statusline = 1

"bufexplorer shows help
let bufExplorerDetailedHelp = 1

"vimfiler
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1

"cursol is moved at last position.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 

"for grep cmd.
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"for arduino
au BufNewFile,BufRead *.ino setf arduino

"for neocomplcache
let g:neocomplcache_enable_at_startup = 1

"for vim-altr
nmap <F2> <Plug>(altr-forward)
nmap <S-F2> <Plug>(altr-back)

