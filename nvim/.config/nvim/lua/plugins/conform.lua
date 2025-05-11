-- return {
--   "stevearc/conform.nvim",
--   optional = true,
--   opts = {
--     formatters_by_ft = {
--       php = { "php-cs-fixer" },
--     },
--   },
-- }

local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "pint" },
      blade = { "blade-formatter" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
    },

    formatters = {
      injected = { options = { ignore_errors = true } },

      ["blade-formatter"] = {
        command = "blade-formatter",
        args = {
          "--write",
          "$FILENAME",
          "--wrap-line-length",
          9999,
          "--wrap-attributes",
          "preserve-aligned",
        },
        cwd = util.root_file({
          ".editorconfig",
          "composer.json",
          "package.json",
        }),
        stdin = false,
      },
    },
  },
}
