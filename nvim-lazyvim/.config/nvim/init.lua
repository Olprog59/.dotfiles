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
      virtual_text = false,
      virtual_lines = { current_line = true, overlay = true, only_current_line = true },
      underline = true,
      update_in_insert = false,
    })
  end,
})

vim.api.nvim_create_autocmd("WinResized", {
  pattern = "*",
  callback = function()
    vim.diagnostic.hide()
    vim.diagnostic.show()
  end,
})

-- vim.go.background = "light"
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "templ",
--   callback = function()
--     vim.treesitter.language.register("html", "templ") -- Forcer le parsing HTML
--     vim.bo.filetype = "html.templ" -- Combiner les deux syntaxes
--   end,
-- })

vim.filetype.add({
  extension = {
    templ = "templ",
  },
  pattern = {
    [".*%.templ"] = "templ",
  },
})
