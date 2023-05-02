local function is_daytime()
  local current_hour = tonumber(os.date("%H"))
  return current_hour >= 6 and current_hour < 18
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = is_daytime() and "github_light_colorblind" or "catppuccino-mocha",
    },
  },
}
