-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "<C-w>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<C-w>", { noremap = true, silent = true })

-- telecope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.api.nvim_set_keymap("n", "<C-p>", "Telescope find_files<CR>", { noremap = true, silent = true })

-- Reset the keymap for the 'H' key
vim.api.nvim_set_keymap("n", "H", "H", { noremap = true, silent = true })
-- Reset the keymap for the 'L' key
vim.api.nvim_set_keymap("n", "L", "L", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>fM", "<cmd>Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })

function OPEN_CP_DEBUG_WINDOW()
  local current_buffer_dir = vim.fn.expand("%:p:h")
  local debug_o_file = current_buffer_dir .. "/DEBUG.o"

  vim.cmd("vnew | wincmd H")
  vim.cmd("30 wincmd |")
  vim.cmd("edit " .. debug_o_file)
  vim.cmd("setlocal nomodifiable")
  vim.cmd("wincmd p")
end

vim.api.nvim_set_keymap("n", "<C-A-m>", ":lua OPEN_CP_DEBUG_WINDOW()<CR>", { noremap = true, silent = true })
