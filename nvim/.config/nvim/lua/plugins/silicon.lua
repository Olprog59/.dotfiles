return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  init = function()
    local wk = require("which-key")
    wk.add({ { "<leader>sc", ":Silicon<CR>", desc = "Snapshot code", mode = "v" } })
  end,
  config = function()
    require("silicon").setup({
      font = "JetBrainsMono Nerd Font=34;Noto Emoji",
      -- the theme to use, depends on themes available to silicon
      theme = "Dracula",
      pad_horiz = 100,
      pad_vert = 80,
      -- to_clipboard = true,
      -- a string or function returning a string that defines the title
      -- showing in the image, only works in silicon versions greater than v0.5.1
      window_title = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
      end,
      output = function()
        return "./" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
      end,
    })
  end,
}
