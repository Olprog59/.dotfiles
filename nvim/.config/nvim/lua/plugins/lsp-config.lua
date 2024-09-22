return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      diagnostics = { virtual_text = false },
      servers = {
        -- Configuration pour les autres serveurs
        jdtls = {},
        tailwindcss = {},
        emmet_language_server = {
          filetypes = {
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
            "php",
            "blade",
          },
        },
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                associations = { "*.php", "*.blade.php" },
                maxSize = 5000000,
              },
            },
          },
        },
        -- Configuration de Volar pour Vue et TypeScript
        volar = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
        },
        -- Configuration de tsserver
        tsserver = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(
              fname
            ) or vim.loop.cwd()
          end,
        },
      },
      -- Configuration pour désactiver tsserver dans les fichiers Vue
      setup = {
        tsserver = function(_, opts)
          opts.filetypes = opts.filetypes or {}
          -- Retirez 'vue' de la liste des filetypes gérés par tsserver
          opts.filetypes = vim.tbl_filter(function(ft)
            return ft ~= "vue"
          end, opts.filetypes)
          return false -- Retournez false pour que lspconfig continue la configuration
        end,
        ["volar"] = function(_, opts)
          opts.on_attach = function(client, bufnr)
            if client.name == "volar" then
              require("nvim-navic").attach(client, bufnr)
            end
            -- Autres configurations on_attach...
          end
          return true
        end,
      },
    },
  },
}
