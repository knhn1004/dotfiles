-- Remap leader to space
vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Show register contents when pressing <leader>r
vim.api.nvim_set_keymap('n', '<leader>r', ':registers<CR>', { noremap = true })

