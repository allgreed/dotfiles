set nocompatible " Welcome to the 21st

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HUD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

colorscheme solarized
set background=light

set relativenumber number " hybrid line numbering
set numberwidth=5
set ruler

set wildmenu

set hlsearch " highlight search matches

set visualbell " disable emmiting bell

set laststatus=2 " always show statusline
set rulerformat=%19(%l,%c%V%7(<0x%B>%)%=%P%)

set ttimeoutlen=10 " wait before sequence completes [ms], no idea why, but I've changed it
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editorial behaviours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart tabs
set tabstop=4       " The width of a TAB is set to 4
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Treat 4 spaces as single TAB
set expandtab       " Expand TABs to spaces
set shiftround      " Round identation to multiples

set nrformats-=octal " I don't work with octal literals really

set nojoinspaces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fidian/hexmode'
Plugin 'ctrlpvim/ctrlp.vim'

" Testing
Plugin 'jiangmiao/auto-pairs'
Plugin 'anekos/hledger-vim'

" Syntax highlighters
Plugin 'leafgarland/typescript-vim'
Plugin 'posva/vim-vue'
Plugin 'pearofducks/ansible-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'
Plugin 'LnL7/vim-nix'
Plugin 'kongo2002/fsharp-vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'idris-hackers/idris-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'google/vim-jsonnet'
Plugin 'allgreed/vim-java-bytecode'
Plugin 'ziglang/zig.vim'
Plugin 'torrancew/vim-openscad'

call vundle#end()
filetype plugin indent on 

let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'
"let g:hexmode_xxd_options = '-g 1'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus " Use system clipboard as default buffer

set undofile
set undodir=$HOME/.vim/undo
" that's swap
set directory^=$HOME/.vim/swap// 

" prevent exploiting modeline vulnerability
if has('patch-8.1.1366') || has('nvim-0.3.6')
    set nomodelineexpr
    set modeline
else
    set modelines=0
    set nomodeline
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set ff=unix

augroup vimrc
    autocmd FileType make setlocal softtabstop=0 noexpandtab " Use actual tab chars in Makefiles
    autocmd FileType make let b:EditorConfig_disable = 1

    autocmd FileType markdown let g:indentLine_enabled = 0 " Disable identLine for .md
    autocmd FileType json let g:indentLine_enabled = 0
    autocmd FileType python setlocal autoindent textwidth=119

    autocmd FileType gitcommit let g:indentLine_enabled = 0
    autocmd FileType gitcommit let b:EditorConfig_disable = 1
    autocmd FileType gitcommit setlocal spell colorcolumn=72

    autocmd BufNewFile,BufRead .envrc setlocal syntax=sh
    autocmd BufNewFile,BufRead .gitignore setlocal syntax=conf

    autocmd BufNewFile,BufRead *.j setlocal ft=java-bytecode
augroup END

autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" preloaded macros
let @r= 'y:%s/"/"/g€kl€kl€kl' " replace locally visually highlighted text
let @g= 'y:%s/"//g€kl€kl' " replace globally visually highlighted text
let @c= 'A,j' " add comma at the end of the line

let mapleader=" "
:map <Leader>h :noh<CR>
:map <Leader>s  i<!--s--><Esc>
:map <Leader>v  i<!--v--><Esc>
:map <Leader>/  /\<\><Left><Left>

"usefull alisaes
:command! Wsudo w ! doas tee %

" typos
:command! Q q
:command! W w

"NERDComment integration
:nnoremap \ :call nerdcommenter#Comment('n', 'Toggle')<CR>
:vnoremap \ :call nerdcommenter#Comment('x', 'Toggle')<CR>

" faster window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" that's just nicer than typing :set paste ;)
set pastetoggle=<f5>

noh " don't show search highlights on vimrc reload
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lessons learned
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" line swapping via single key combination is not nearly as usefull as it
" apperas. Most of the time I've ended up triggering it indientally, wasting
" time in the process

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Testin area
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" what the shit is this?
set complete+=kspell

nnoremap <Leader><Leader> <C-^>

:command! Pl :set spelllang=pl spell
set nospell " fixes interpreting the above, but possible messes with spellcheck on gitcommit

set history=100 "is this enough"

:command! Plm :normal! ggO # vim: set spelllang=pl spell:<ESC>^x
set nospell " fixes interpreting the above, but possible messes with spellcheck on gitcommit

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>v
inoremap <silent> <C-S>         <C-O>:update<CR>
set scrolloff=3
set smartindent

" autopairs
" # how about only in insert mode?
let g:AutoPairsShortcutJump = '<C-F>'

" enable all the colors xD
set t_Co=256

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
