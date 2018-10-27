set nocompatible " Welcome to the 21st

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set ff=unix " Only shitfucks use DOS line endings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HUD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set relativenumber " Hybrid line numbering
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Behaviours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start " I will backspace whatever I like!
set hlsearch " Highlight search matches

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

let @f= 'y/"' " search for visually hightlighted text

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TODO - tidy it up and put inside a section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""" smart tabs
if has("autocmd")
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" TODO:  bind :noh to something
" TODO: Also display 2 spaces as 4 spaces except for ansible .yml files

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
