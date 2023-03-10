return {
  -- add symbols-outline
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add your options that should be passed to the setup() function here
      toggler = {
        ---Line-comment toggle keymap
        line = "<C-_>",
      },
      opleader = {
        ---Block-comment keymap
        block = "<C-_>",
      },
    },
  },
}
