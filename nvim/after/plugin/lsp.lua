local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'cssmodules_ls',
  'emmet_ls',
  'html',
  'clangd',
  'gopls',
})




local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
-- vim.keymap.set("n", "<leader><C-.>", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end)

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<C-.>", function() vim.lsp.buf.code_action() end, opts)

  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})


local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

-- if not lspconfig.clangd then
configs.clangd = {
  default_config = {
    cmd = { 'clangd', '--compile-commands-dir=~/.clang/' },
    filetypes = { 'c', 'cpp' },
    root_dir = lspconfig.util.root_pattern('.git', 'compile_commands.json'),
  },
}
-- end

lspconfig.clangd.setup {}


-- format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
