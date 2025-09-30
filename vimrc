set nocompatible " Welcome to the 21st

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HUD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set background=light
set termguicolors
colorscheme selenized

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
set magic " you're a wizzard, Harry!
" but in all seriousness, this is the default, I'd just like to keep it
" explicit

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
" ^ this is nice, but requires some tweaking, while I have a moment
Plugin 'dense-analysis/ale'

" Language-specific
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
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

call vundle#end()
filetype plugin indent on 

let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'
"let g:hexmode_xxd_options = '-g 1'

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:ale_disable_lsp = 1
let g:ale_use_neovim_diagnostics_api = 1
let g:syntastic_javascript_eslint_args = "--cache"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus " Use system clipboard as default buffer

set undofile
set undodir=$HOME/.vim/undo

set directory^=$HOME/.vim/swap// " that's swap

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

let mapleader=" "
:map <Leader>h :noh<CR>
:map <Leader>s  i<!--s--><Esc>
:map <Leader>v  i<!--v--><Esc>
:map <Leader>/  /\<\><Left><Left>

" double space => alternate file, instanely usefull
nnoremap <Leader><Leader> <C-^>

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
set nospell " nor activate spell check by default
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lessons learned
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" line swapping via single key combination is not nearly as usefull as it
" apperas. Most of the time I've ended up triggering it indientally, wasting
" time in the process

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Testin area
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if this works well -> use the \ for the TODO comment mapping
:nnoremap # :call nerdcommenter#Comment('n', 'Toggle')<CR>
:vnoremap # :call nerdcommenter#Comment('x', 'Toggle')<CR>

set ignorecase
set smartcase

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescriptreact': ['eslint'],
\}
nmap <Leader>f <Plug>(ale_fix)

" autopairs
" TODO: how about only in insert mode?
let g:AutoPairsShortcutJump = '<C-F>'

set history=10000 "max

noremap <silent> <C-S>          :update<CR>
" TODO: this doesn't preserve the selection
vnoremap <silent> <C-S>         <C-C>:update<CR>v
inoremap <silent> <C-S>         <C-O>:update<CR>

set scrolloff=3

set smartindent

set wildignore+=node_modules/**,dist/**

" clever way to not have to remember %:h
cnoremap <expr> %% getcmdtype() == ":" ? expand('%:h').'/' : '%%'

:command! CoppyPwd let @+ = expand('%:p')
