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
local lspconfig = require('lspconfig')

lspconfig.pyright.setup{
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        --ignore = { '*' },
      },
    },
  },
}
-- TODO: reformat this? o.0
local on_attach = function(client, bufnr)
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
end
lspconfig.ruff.setup {
    on_attach = on_attach,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
}

lspconfig.zls.setup{}
lspconfig.ts_ls.setup{
    cmd = {
        "npx", "typescript-language-server", "--stdio"
    }
}
lspconfig.nil_ls.setup{}
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <Leader>f <cmd>lua vim.lsp.buf.format()<CR>


set completeopt=menu,noselect
lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  -- TODO: how much do I need of this? How much are the defaults?
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
    nvim_lsp = true;
    calc = true;
    --spell = true; not sure if this one is fun or not ;d
  };
}
EOF
