return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Doit être déclaré ici
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    inlay_hints = { enabled = true },
    diagnostics = { virtual_text = false },
    servers = {
      -- Serveur de langage pour Angular
      angularls = {
        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
        cmd = {
          "ngserver",
          "--stdio",
          "--tsProbeLocations",
          "node_modules/@angular/language-service",
          "--ngProbeLocations",
          "node_modules/@angular/language-service",
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function(client, bufnr)
          -- Vos mappings personnalisés ici
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Show references" })
        end,
        on_new_config = function(new_config)
          new_config.cmd = {
            "node_modules/.bin/ngserver",
            "--stdio",
            "--tsProbeLocations",
            "node_modules/@angular/language-service",
            "--ngProbeLocations",
            "node_modules/@angular/language-service",
          }
        end,
      },
      -- Serveur de langage pour Vue (Volar)
      volar = {
        filetypes = {
          "typescript",
          "vue",
        },
        root_dir = util.root_pattern("src/App.vue"),
      },
      -- Serveur de langage pour React (tsserver)
      tsserver = { enabled = false },
      -- Désactiver les serveurs inutiles pour éviter les conflits
      vtsls = { enabled = false },
      htmx = { enabled = false },
      cssmodules_ls = { enabled = false },
      tailwindcss = { enabled = false },
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
          "angular",
        },
      },
      -- Autres serveurs de langage que vous souhaitez utiliser
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      },
      -- Ajoutez ici les configurations pour d'autres serveurs (Python, Go, etc.)
    },
    -- Configuration pour désactiver tsserver dans les fichiers Vue (si nécessaire)
    setup = {
      tsserver = function(_, opts)
        opts.filetypes = opts.filetypes or {}
        -- Retirez 'vue' de la liste des filetypes gérés par tsserver
        opts.filetypes = vim.tbl_filter(function(ft)
          return ft ~= "vue"
        end, opts.filetypes)
        return true -- Retournez false pour que lspconfig continue la configuration
      end,
      angularls = function(_, opts)
        require("lspconfig").angularls.setup(vim.tbl_extend("force", opts, {
          on_attach = function(client, bufnr)
            -- Désactiver la fonctionnalité de renommage si nécessaire
            client.server_capabilities.renameProvider = false

            -- Ajouter d'autres configurations on_attach ici
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "gd",
              "<cmd>lua vim.lsp.buf.definition()<CR>",
              { noremap = true, silent = true }
            )
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "gr",
              "<cmd>lua vim.lsp.buf.references()<CR>",
              { noremap = true, silent = true }
            )
          end,
        }))
      end,
      volar = function(_, opts)
        opts.on_attach = function(client, bufnr)
          if client.name == "volar" then
            require("nvim-navic").attach(client, bufnr)
          end
        end
        return true
      end,
    },
  },
  config = function(_, opts)
    -- Configuration LSP standard pour LazyVim
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Appliquer les capacités à tous les serveurs LSP
    for server, server_opts in pairs(opts.servers) do
      server_opts.capabilities = vim.tbl_deep_extend("force", capabilities, server_opts.capabilities or {})
    end

    require("lspconfig.configs").angularls = {
      default_config = {
        cmd = opts.servers.angularls.cmd,
        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
        root_dir = require("lspconfig.util").root_pattern("angular.json"),
      },
    }
  end,
}
