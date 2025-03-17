return {
  "nvim-java/nvim-java",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- Configure nvim-java avant de configurer le LSP
    require("java").setup({
      jdk = {
        auto_install = false,
      },
      root_markers = {
        "settings.gradle",
        "settings.gradle.kts",
        "pom.xml",
        "build.gradle",
        "mvnw",
        "gradlew",
        "build.gradle",
        "build.gradle.kts",
      },
    })

    -- Configure le serveur LSP jdtls
    require("lspconfig").jdtls.setup({
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-current",
                path = "~/.sdkman/candidates/java/current",
              },
            },
          },
        },
      },
    })
  end,
}
