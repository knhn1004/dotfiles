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

-- Define a function to compile and run C++ files
function CompileAndRunCpp()
  -- Get the current buffer name
  local filename = vim.fn.expand('%:p')

  -- Compile the file using g++
  local cmd = 'g++ -std=c++20 -O2 -Wall -Wextra -Wshadow -o a.out '
    .. vim.fn.shellescape(filename)
  vim.fn.system(cmd)

  -- Run the compiled file in a new vertical split pane
  vim.cmd('vsplit')
  vim.cmd('terminal ./a.out')

  -- Switch back to the original buffer
  vim.api.nvim_command('wincmd h')
end

-- Bind the function to a key combination
vim.api.nvim_set_keymap('n', '<C-A-n>', ':lua CompileAndRunCpp()<CR>', { noremap = true, silent = true })


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

