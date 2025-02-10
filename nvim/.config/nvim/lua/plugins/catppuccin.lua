return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {
        -- mocha = {
        --   rosewater = "#ffc0b9",
        --   flamingo = "#f5aba3",
        --   pink = "#f592d6",
        --   mauve = "#c0afff",
        --   red = "#ea746c",
        --   maroon = "#ff8595",
        --   peach = "#fa9a6d",
        --   yellow = "#ffe081",
        --   green = "#99d783",
        --   teal = "#47deb4",
        --   sky = "#00d5ed",
        --   sapphire = "#00dfce",
        --   blue = "#00baee",
        --   lavender = "#abbff3",
        --   text = "#cccccc",
        --   subtext1 = "#bbbbbb",
        --   subtext0 = "#aaaaaa",
        --   overlay2 = "#999999",
        --   overlay1 = "#888888",
        --   overlay0 = "#777777",
        --   surface2 = "#666666",
        --   surface1 = "#555555",
        --   surface0 = "#444444",
        --   base = "#202020",
        --   mantle = "#222222",
        --   crust = "#333333",
        -- },
      },
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        telescope = {
          enabled = true,
        },
        aerial = true,
        alpha = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        semantic_tokens = true,
        treesitter_context = true,
        which_key = true,

        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
      custom_highlights = function(colors)
        return {
          TabLineSel = { bg = colors.flamingo },
          CmpBorder = { fg = colors.surface2 },
          Pmenu = { bg = colors.none },
          CursorLine = { bg = colors.surface2 },
          LineNr = { fg = colors.overlay2 },
          Comment = { fg = colors.overlay2 },
          NeoTreeGitIgnored = { fg = colors.overlay2 },
          NeoTreeDotfile = { fg = colors.overlay2 },
          -- Visual = { bg = colors.overlay1, fg = colors.mantle },
        }
      end,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
    })

    -- setup must be called before loading
    vim.cmd.colorscheme("catppuccin")
  end,
}
