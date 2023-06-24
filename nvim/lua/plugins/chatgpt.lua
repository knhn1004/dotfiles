return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    commit = "8820b99c",
    config = function()
      -- check for OPENAI_API_KEY environment variable
      -- if not exist then do not load plugin
      exists = os.getenv("OPENAI_API_KEY")
      if exists == nil then
        return {}
      end
      require("chatgpt").setup({
        chat = {
          keymaps = {
            yank_last = "<C-y>",
            close = "<C-c>",
            scroll_up = "<C-u>",
            scroll_down = "<C-d>",
            toggle_settings = "<C-o>",
            cycle_windows = "<Tab>",
            select_session = "<C-g>",
          },
          popup_input = {
            submit = "<CR>",
          },
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
