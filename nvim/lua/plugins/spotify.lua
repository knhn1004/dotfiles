--[[ return {
  -- add symbols-outline
  {
    "KadoBOT/nvim-spotify",
    opts = function(_, opts)
      local spotify = require("nvim-spotify")

      spotify.setup({
        -- default opts
        status = {
          update_interval = 10000, -- the interval (ms) to check for what's currently playing
          format = "%s %t by %a", -- spotify-tui --format argument
        },
      })
    end,
  },
} ]]
return {
  -- "srishanbhattarai/neovim-spotify",
}
