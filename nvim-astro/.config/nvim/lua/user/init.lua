local lspconfig = require "lspconfig"

lspconfig.templ.setup {
  cmd = { "templ", "lsp" },
  filetypes = { "templ" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.templ",
  callback = function() vim.cmd "silent! !templ fmt %" end,
})
