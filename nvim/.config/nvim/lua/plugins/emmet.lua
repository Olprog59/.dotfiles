return {
  "olrtg/emmet-language-server",
  config = function()
    -- Autocommand to start emmet-language-server for supported filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "pug",
        "typescriptreact",
        "vue",
      },
      callback = function()
        vim.lsp.start({
          cmd = { "emmet-language-server", "--stdio" },
          root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
                ["output.inline_break"] = true,
              },
            },
          },
        })
      end,
    })
  end,
}
