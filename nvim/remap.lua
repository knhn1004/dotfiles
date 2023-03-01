-- Remap leader to space
vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Show register contents when pressing <leader>r
vim.keymap.set('n', '<leader>r', vim.cmd.register)

