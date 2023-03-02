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


-- enable another line of comment after an empty line of comment
vim.opt_local.formatoptions:remove({ 'r', 'o' })

-- set vim search case insensitive
vim.opt.ignorecase = true
