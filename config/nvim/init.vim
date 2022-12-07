set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-compe'
Plugin 'lambdalisue/suda.vim'

Plugin 'ThePrimeagen/refactoring.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-treesitter/nvim-treesitter'

lua << EOF
require'lspconfig'.pylsp.setup{
    plugins = {
        flake8 = {
            enabled = true,
            maxLineLength = 100,
        }
    }
}
require'lspconfig'.rnix.setup{}
require'lspconfig'.zls.setup{}
require'lspconfig'.tsserver.setup{
    cmd = {
        "npx", "typescript-language-server", "--stdio"
    }
}

EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.rename()<CR>

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
    --treesitter = true;
  };
}
EOF

" TESTING
lua require('refactoring').setup({})
" autocmd FileType typescriptreact set ft=typescript
" it breaks the React langserver though
" https://github.com/ThePrimeagen/refactoring.nvim/issues/233
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,

    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
  },
}
-- this keymap doesn't work
-- vim.api.nvim_set_keymap(
--     "v",
--     "<leader>rr",
--     ":lua require('refactoring').select_refactor()<CR>",
--     { noremap = true, silent = true, expr = false }
-- )
EOF
