require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "rust", 
    "c", 
    "lua", 
    "vim", 
    "help", 
    "javascript", 
    "typescript", 
    "dart", 
    "cpp", 
    "java" 
  },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
}
