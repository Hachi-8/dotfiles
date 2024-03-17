set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein.vimのインストール
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:python3_path = trim(system('which python3'))
let g:python3_dir = fnamemodify(s:python3_path, ':h')
let g:python3_host_prog = g:python3_dir . '/python3'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set dein base/source/runtime path (required)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:dein_base = '~/.cache/dein/'
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' .. s:dein_src

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Leader>の設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pluginの読み込み
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if dein#load_state(s:dein_base)
 call dein#begin(s:dein_base)
 call dein#add(s:dein_src)

 let s:toml_dir = expand('~/.config/nvim')
 call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy':0})
 call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy':1})

 call dein#end()
 call dein#save_state()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 起動時にpluginのinstall
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if dein#check_install()
 call dein#install()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('syntax')
  syntax on
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme iceberg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set number
set cursorline
set cursorcolumn
set hlsearch
set incsearch
set smartindent
set wildmenu " cmd mode filename completion
set laststatus=2
set noshowmode
set ignorecase
set expandtab " tab -> spaces
set tabstop=2
set shiftwidth=0 " tabstopに従う
set softtabstop=-1 " shiftwidthに従う
set completeopt=menuone,noinsert
set directory=/tmp
set list
set listchars=tab:>-,space:.
set clipboard+=unnamed
set encoding=UTF-8
set fileencodings=utf-8,sjis
set guifont=HackGen\ 12
set foldmethod=manual
set laststatus=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> jj <ESC>
nnoremap <silent> gl gt<Cr>
nnoremap <silent> gh gT<Cr>
tnoremap <silent> <C-\> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 移動
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim config files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><Leader>. :tabe ~/.config/nvim/init.vim<CR>
nnoremap <silent><Leader>1 :tabe ~/.config/nvim/dein.toml<CR>
nnoremap <silent><Leader>2 :tabe ~/.config/nvim/dein_lazy.toml<CR>
nnoremap <silent><Leader>3 :e ~/.config/nvim/lua<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" background
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <C-s> <C-z><CR>

" indent
if has("autocmd")
    autocmd BufEnter *.php setl expandtab tabstop=4
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 削除でyankしない
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D

