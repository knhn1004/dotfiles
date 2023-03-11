-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- fix clangd w/ copilot conflict utf-16
local HOME = os.getenv("HOME")
require("lspconfig").clangd.setup({
  cmd = { HOME .. "/.local/share/nvim/mason/bin/clangd", "--offset-encoding=utf-16" },
})
