set nocompatible " Welcome to the 21st

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HUD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

colorscheme solarized
set background=light

set relativenumber number "hybrid line numbering
set ruler

set wildmenu

set hlsearch " Highlight search matches

set visualbell " Disable emmiting bell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editorial behaviours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
" TODO: talk to wiklas about parantheis manipulation in vim
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'

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
Plugin 'google/vim-jsonnet'

call vundle#end()
filetype plugin indent on 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus " Use system clipboard as default buffer

set undofile
set undodir=$HOME/.vim/undo

" securemodelines
let g:secure_modelines_verbose = 1
set nomodeline " prevent forcefull disable warning

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

"testing
:nnoremap \ :call NERDComment('n', 'Toggle')<CR>
:vnoremap \ :call NERDComment('x', 'Toggle')<CR>

noh " don't show search highlights on vimrc reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Testin area
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Ctrl + S?
" TODO: Also display 2 spaces as 4 spaces except for ansible .yml files ???

set backspace=" vim knows how to handle backspace got it right since vi

" TODO: What exactly does this do ???
set laststatus=2 "what?
set t_Co=256 "does ?
set ttimeoutlen=10 " it do?

set history=100 "is this enough"

:command! Wsudo w ! sudo tee %
" typos
:command! Q q
:command! W w
