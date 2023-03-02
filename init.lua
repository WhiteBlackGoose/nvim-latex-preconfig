-- Installation of plugin manager
local lazypath = "/tmp/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require('lazy').setup ({
    -- Live recompilation
    'lervag/vimtex',

    -- Autocompletion and errors
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    { 'https://github.com/hrsh7th/nvim-cmp' },
    'neovim/nvim-lspconfig',

    -- Theme
    'doums/darcula',
})

-- Run compilation on start
vim.cmd[[
:autocmd BufNewFile,BufRead *.tex VimtexCompile
]]

-- Basic settings
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>', '<nop>', { noremap = true, silent = true })
vim.cmd[[let mapleader=" "]]
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = false
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'


-- Live compilation
vim.g.vimtex_compiler_latexmk = {
    build_dir = '.out',
    options = {
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-interaction=nonstopmode',
        '-synctex=1'
    }
}
vim.g.vimtex_view_method = 'zathura'


-- LSP
local cmp = require('cmp')
cmp.setup({
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
    sources =  cmp.config.sources({
        { name = "nvim_lsp" },
        { name = 'luasnip' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    })
})
local lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.texlab.setup{capabilities = capabilities}


-- Theme
vim.o.background = "dark"
vim.cmd.colorscheme('darcula')


-- Folding
vim.o.foldcolumn = '1'
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.g.vimtex_fold_enabled = true
vim.api.nvim_set_keymap('n', '<leader>j', 'zc', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', 'zo', { noremap = true, silent = true })
