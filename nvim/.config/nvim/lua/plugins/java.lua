return {
  {
    "nvim-java/nvim-java",
    lazy = false,
    config = function()
      require("java").setup({
        jdtls = {
          version = "1.46.1", -- Version vérifiée sur Eclipse
          settings = {
            java = {
              home = "~/.sdkman/candidates/java/current/",
            },
          },
        },
      })
      require("lspconfig").jdtls.setup({})
    end,
  },
}
