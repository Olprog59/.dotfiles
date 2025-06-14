-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.spring-boot" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.recipes.ai" },

  { import = "astrocommunity.recipes.vscode-icons" },

  { import = "astrocommunity.motion.mini-move" },

  { import = "astrocommunity.programming-language-support.kulala-nvim" },
  { import = "astrocommunity.programming-language-support.web-tools-nvim" },

  { import = "astrocommunity.recipes.diagnostic-virtual-lines-current-line" },

  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  { import = "astrocommunity.utility.live-server-nvim" },

  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },

  { import = "astrocommunity.icon.mini-icons" },

  -- { import = "astrocommunity.workflow.precognition-nvim" },
  -- { import = "astrocommunity.indent.indent-rainbowline" },

  { import = "astrocommunity.git.mini-diff" },

  { import = "astrocommunity.fuzzy-finder.fzf-lua" },

  { import = "astrocommunity.editing-support.vim-visual-multi" },

  { import = "astrocommunity.docker.lazydocker" },

  { import = "astrocommunity.completion.cmp-emoji" },
  { import = "astrocommunity.completion.cmp-nerdfont" },

  { import = "astrocommunity.comment.mini-comment" },

  { import = "astrocommunity.color.transparent-nvim" },

  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },

  { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.lsp.dev-tools-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.lsp.sonarlint-nvim" },

  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.motion.nvim-surround" },

  -- import/override with your plugins folder
}
