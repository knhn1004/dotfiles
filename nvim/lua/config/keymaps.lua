-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "<C-w>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<C-w>", { noremap = true, silent = true })

-- Define a function to compile and run C++ files
function CompileAndRunCpp()
  -- Get the current buffer name
  local filename = vim.fn.expand("%:p")

  -- Check if the current buffer is modified
  if vim.bo.modified then
    -- Save the current buffer before continuing
    vim.cmd("write")
  end

  -- Compile the file using g++
  local cmd = "g++ -std=c++20 -O2 -Wall -Wextra -Wshadow -o a.out " .. vim.fn.shellescape(filename)
  vim.fn.system(cmd)

  -- Run the compiled file in the same buffer
  vim.cmd("terminal! ./a.out")

  -- Switch back to the original buffer
  vim.api.nvim_command("wincmd h")
end

-- Bind the function to a key combination
vim.api.nvim_set_keymap("n", "<C-A-n>", ":lua CompileAndRunCpp()<CR>", { noremap = true, silent = true })

-- telecope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.api.nvim_set_keymap("n", "<C-p>", "Telescope find_files<CR>", { noremap = true, silent = true })

-- Reset the keymap for the 'H' key
vim.api.nvim_set_keymap("n", "H", "H", { noremap = true, silent = true })
-- Reset the keymap for the 'L' key
vim.api.nvim_set_keymap("n", "L", "L", { noremap = true, silent = true })

-- move current line in up/down in normal mode
vim.api.nvim_set_keymap("n", "<C-j>", "ddp", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "ddkP", { noremap = true, silent = true })

-- move multilines up/down in visual mode
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
