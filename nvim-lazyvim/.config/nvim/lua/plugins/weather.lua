return {
  "rmrf/weather.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- only pick the first 3 cities
  opts = { cities = { "Lille", "Frejus", "Stockholm" } },
  cmd = "Weather", -- Lazy Loading
}
