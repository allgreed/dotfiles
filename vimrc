"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " Welcome to the 21st

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set ff=unix " Only shitfucks use DOS line endings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set relativenumber " Hybrid line numbering
set number

set backspace=indent,eol,start " I will backspace whatever I like!

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

call vundle#end()
filetype plugin indent on 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set background=dark
colorscheme solarized

"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamedplus " Use system clipboard as default buffer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OMGWTF???
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:airline_skip_empty_sections = 1

""""""" smart tabs
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

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

" search for visually hightlighted text
vnoremap <c-f> y<ESC>/<c-r>"<CR>   

" Testin' area :D

"let g:airline#extensions#tabline#enabled = 1

set wildmenu

let g:airline_powerline_fonts = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:Powerline_symbols='unicode'

"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2
set t_Co=256
set ttimeoutlen=10
"set term=xterm-256color
autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set history=100

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

  let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 79,
      \ 'x': 60,
      \ 'y': 88,
      \ 'z': 45,
      \ 'warning': 80,
      \ 'error': 80,
      \ }

let g:airline_inactive_collapse=1

" Disable this shitty bell sound
set visualbell
set noerrorbells

" Testing search highlighting
set hlsearch
