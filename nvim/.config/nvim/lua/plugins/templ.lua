return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  opts = {
    servers = {
      tsserver = {
        root_dir = function()
          return vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json" }, { upward = true })[1])
        end,
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
      templ = {
        on_attach = function(client, bufnr)
          client.server_capabilities.semanticTokensProvider = nil
          -- Activation contextuelle d'Emmet
          vim.api.nvim_create_autocmd("BufEnter", {
            buffer = bufnr,
            callback = function()
              local node = vim.treesitter.get_node()
              vim.b[bufnr].emmet_enabled = node and node:type() == "element"
            end,
          })
        end,
      },
      emmet_ls = {
        filetypes = {
          "html",
          "templ",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        init_options = {
          extendedFileTypes = {
            "templ",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
          html = {
            options = {
              ["output.selfClosingStyle"] = "xhtml",
            },
          },
        },
      },
    },
  },
}
