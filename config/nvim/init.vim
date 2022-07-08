set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-compe'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'lambdalisue/suda.vim'

lua << EOF
-- this has some kind of problems on Ubuntu
--require'lspconfig'.pyls.setup{}
require'lspconfig'.rnix.setup{}
require'lspconfig'.zls.setup{}
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" what's the difference betwene hover and signature_help? o.0
"nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.signature_help()<CR>
" erm????
"nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

set completeopt=menuone,noselect

lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    --spell = true; not sure if this one is fun or not ;d
    nvim_lsp = true;
    treesitter = true;
  };
}
EOF
