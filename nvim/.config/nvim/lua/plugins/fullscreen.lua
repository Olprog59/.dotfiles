return {
  "propet/toggle-fullscreen.nvim",
  keys = {
    {
      "<leader>f",
      function()
        require("toggle-fullscreen"):toggle_fullscreen()
      end,
      desc = "toggle-fullscreen",
    },
  },
}
