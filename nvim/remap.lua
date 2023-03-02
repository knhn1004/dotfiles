-- Remap leader to space
vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Show register contents when pressing <leader>r
vim.keymap.set('n', '<leader>r', vim.cmd.register)

vim.keymap.set('n', '<leader>M', vim.cmd.Mason)

-- Define a function to compile and run C++ files
function CompileAndRunCpp()
  -- Get the current buffer name
  local filename = vim.fn.expand('%:p')

  -- Compile the file using g++
  local cmd = 'g++ -std=c++20 -O2 -Wall -Wextra -Wshadow -o a.out '
    .. vim.fn.shellescape(filename)
  vim.fn.system(cmd)

  -- Run the compiled file in the same buffer
  vim.cmd('terminal! ./a.out')

  -- Switch back to the original buffer
  vim.api.nvim_command('wincmd h')
end

-- Bind the function to a key combination
vim.api.nvim_set_keymap('n', '<C-A-n>', ':lua CompileAndRunCpp()<CR>', { noremap = true, silent = true })

