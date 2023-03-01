-- -- Define the `vim` global variable
vim = vim or {}
use = use or {}

-- Add the absolute path to the package path
package.path = package.path .. ";" .. os.getenv("HOME") .. "/dotfiles/nvim/?.lua"

require('plugins')
require('remap')

-- Set options
vim.cmd('set rnu nu')
vim.cmd('syntax on')

vim.cmd('set tabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set expandtab')

vim.o.termguicolors = true

-- Set the prefix key for window commands to ctrl+hjkl
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Configure Commentary plugin
vim.g.commentary_line_mapping = "<C-_>"
vim.g.commentary_register_keybindings = {
  n = { "<leader>c", "<leader>" },
  v = { "<leader>c", "<leader>" },
}

-- Enable commenting with Ctrl+/
vim.api.nvim_set_keymap('n', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true })


-- ultisnip dir
vim.g.UltiSnipsSnippetDirectories = {'~/dotfiles/nvim/snippets'}
-- vim.g.UltiSnipsExpandTrigger = "<Tab>"

