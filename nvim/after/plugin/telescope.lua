local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.api.nvim_command('autocmd BufEnter * :lua require("lazygit.utils").project_root_dir()')

-- Add keymapping for lazygit command
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua require("telescope").extensions.lazygit.lazygit()<CR>',
  { noremap = true, silent = true })
