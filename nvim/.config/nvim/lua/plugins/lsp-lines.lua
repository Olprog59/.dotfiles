return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_lines").setup()

    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = {
        overlay = true,
        only_current_line = true,
        highlight_whole_line = false,
      },
      underline = true,
    })

    vim.api.nvim_create_autocmd("WinResized", {
      pattern = "*",
      callback = function()
        vim.diagnostic.hide()
        vim.diagnostic.show()
      end,
    })
  end,
}
