set nocompatible " Welcome to the 21st

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HUD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

colorscheme solarized
set background=dark

set relativenumber number "hybrid line numbering

set hlsearch " Highlight search matches

set visualbell " Disable emmiting bell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editorial behaviours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start " I will backspace whatever I like!

" Smart tabs
set tabstop=4       " The width of a TAB is set to 4
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Treat 4 spaces as single TAB
set expandtab       " Expand TABs to spaces

set nrformats-=octal " I don't work with octal literals really

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'ciaranm/securemodelines' "TODO: set nomodelineexpr after 8.1.1366
Plugin 'Yggdroot/indentLine'

" Testing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Syntax highlighters
Plugin 'leafgarland/typescript-vim'
Plugin 'posva/vim-vue'
Plugin 'pearofducks/ansible-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'cespare/vim-toml'
Plugin 'jvirtanen/vim-hcl'
Plugin 'rust-lang/rust.vim'
Plugin 'LnL7/vim-nix'
Plugin 'kongo2002/fsharp-vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'idris-hackers/idris-vim'
Plugin 'isRuslan/vim-es6'

call vundle#end()
filetype plugin indent on 

" securemodelines
let g:secure_modelines_verbose = 1
set nomodeline " prevent forcefull disable warning

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamedplus " Use system clipboard as default buffer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set ff=unix

augroup vimrc
    autocmd FileType make setlocal softtabstop=0 noexpandtab " Use actual tab chars in Makefiles

    autocmd FileType markdown let g:indentLine_enabled = 0 " Disable identLine for .md
    autocmd FileType json let g:indentLine_enabled = 0
    autocmd FileType gitcommit let g:indentLine_enabled = 0

    autocmd FileType gitcommit setlocal spell " Use spellcheck by default in git commit messages

    autocmd BufNewFile,BufRead .envrc set syntax=sh
    autocmd BufNewFile,BufRead .gitignore set syntax=conf
augroup END

autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" preloaded macros
let @r= 'y:%s/"/"/OD' " replace locally visually highlighted text
let @g= 'y:%s/"//OD' " replace globally visually highlighted text

let mapleader=" "
:map <Leader>h :noh<CR>
:map <Leader>s  i<!--s--><Esc>
:map <Leader>v  i<!--v--><Esc>

noh " don't show search highlights on vimrc reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Testin area
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile

" TODO: Ctrl + S?
" TODO: Also display 2 spaces as 4 spaces except for ansible .yml files ???
" TODO: What exactly does this do ???
set wildmenu
set laststatus=2
set t_Co=256
set ttimeoutlen=10

set history=100
