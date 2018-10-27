set nocompatible " Welcome to the 21st

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set ff=unix " Only shitfucks use DOS line endings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HUD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hybrid line numbering
" current line is absolute, rest is relative
set relativenumber
set number

set hlsearch " Highlight search matches

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editorial behaviours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start " I will backspace whatever I like!

" Smart tabs
set tabstop=4       " The width of a TAB is set to 4
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Treat 4 spaces as single TAB
set expandtab       " Expand TABs to spaces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'editorconfig/editorconfig-vim'

" Syntax highlighters
Plugin 'leafgarland/typescript-vim'
Plugin 'posva/vim-vue'
Plugin 'elixir-editors/vim-elixir'
Plugin 'pearofducks/ansible-vim'
Plugin 'hashivim/vim-terraform'

call vundle#end()
filetype plugin indent on 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set background=dark
colorscheme solarized
noh " don't show search highlights on vimrc reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamedplus " Use system clipboard as default buffer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Preloaded macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let @f= 'y/"' " search for visually highlighted text
let @r= 'y:s/"//OD' " replace locally visually highlighted text
let @g= 'y:%s/"//OD' " replace globally visually highlighted text

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrc
    autocmd FileType make setlocal softtabstop=0 noexpandtab " Use actual tab chars in Makefiles
    autocmd FileType gitcommit setlocal spell " Use spellcheck by default in git commit messages
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TODO - tidy it up and put inside a section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO:  bind :noh to something
" TODO: Also display 2 spaces as 4 spaces except for ansible .yml files ???

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Testin area
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: What exactly does this do ???
set wildmenu
set laststatus=2
set t_Co=256
set ttimeoutlen=10
"set term=xterm-256color
autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc
set history=100

" Disable this shitty bell sound
set visualbell
set noerrorbells
