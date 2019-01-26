"Basics
set nocompatible
syntax enable
set shiftwidth=2
set clipboard=unnamed
set autoread
set showmode
set showcmd
set wildmenu
set ruler
set autoindent
set expandtab
set wrap
set nohlsearch
set incsearch
set ignorecase
set showmatch
set fixeol
set noeol
set number
set laststatus=2
filetype on
filetype indent on

"Mappings
let mapleader = ','
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :File<CR>
nnoremap <leader>g :GitGutterToggle<CR>

"Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rails'

call vundle#end()

filetype plugin indent on
