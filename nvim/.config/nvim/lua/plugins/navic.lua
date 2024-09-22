return {
  "SmiteshP/nvim-navic",
  opts = function(_, opts)
    opts.lsp = {
      auto_attach = false,
      preference = { "volar", "tsserver" },
    }
    return opts
  end,
}
