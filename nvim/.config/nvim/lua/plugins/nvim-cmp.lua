return {
  "nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
  opts = function(_, opts)
    table.insert(opts.sources, { name = "emoji" })
  end,
}
