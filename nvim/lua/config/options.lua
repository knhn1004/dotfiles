-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"
vim.opt.wrap = true

vim.cmd("autocmd FileType java setlocal shiftwidth=3") -- CS1B specific - TODO: remove this later
