-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     vim.schedule(function()
--       vim.diagnostic.config({
--         virtual_text = false,
--         virtual_lines = true,
--       })
--       -- Forcer la mise à jour des diagnostics
--       vim.diagnostic.show()
--     end)
--   end,
-- })
--
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
  callback = function()
    vim.diagnostic.config({
      virtual_text = true,
      virtual_lines = { current_line = true },
      underline = true,
      update_in_insert = false,
    })
  end,
})
-- vim.go.background = "light"
