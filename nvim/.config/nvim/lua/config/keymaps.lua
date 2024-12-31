local map = LazyVim.safe_keymap_set
local default_opts = { noremap = true, silent = true }

-- map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>w$", "<C-W>v", { desc = "Split Window Right", remap = true })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>$", "<C-W>v", { desc = "Split Window Right", remap = true })
--
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

-- Replace 'keymap.set' with 'map' and adjust options as needed
map("n", "x", '"_x', { noremap = true, silent = true })

-- Increment/decrement
map("n", "+", "<C-a>", { noremap = true })
map("n", "-", "<C-x>", { noremap = true })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { noremap = true })

-- Save file and quit (commented out originally, shown here for consistency)
-- map("n", "<Leader>w", ":update<Return>", { noremap = true, silent = true })
-- map("n", "<Leader>q", ":quit<Return>", { noremap = true, silent = true })
-- map("n", "<Leader>Q", ":qa<Return>", { noremap = true, silent = true })

-- File explorer with NvimTree
map("n", "<Leader>f", ":NvimTreeFindFile<Return>", { noremap = true, silent = true })
map("n", "<Leader>t", ":NvimTreeToggle<Return>", { noremap = true, silent = true })

-- Tabs
-- map("n", "te", ":tabedit", { noremap = true })
-- map("n", "<tab>", ":tabnext<Return>", { noremap = true, silent = true })
-- map("n", "<s-tab>", ":tabprev<Return>", { noremap = true, silent = true })
-- map("n", "tw", ":tabclose<Return>", { noremap = true, silent = true })

-- Split window
map("n", "ss", ":split<Return>", { noremap = true, silent = true })
map("n", "sv", ":vsplit<Return>", { noremap = true, silent = true })

-- Move window
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })

-- Resize window
map("n", "<C-S-h>", "<C-w><", { noremap = true })
map("n", "<C-S-l>", "<C-w>>", { noremap = true })
map("n", "<C-S-k>", "<C-w>+", { noremap = true })
map("n", "<C-S-j>", "<C-w>-", { noremap = true })

-- Diagnostics
map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, { noremap = true, silent = true })

-- Similar function for previous, ensuring to keep the code consistent
map("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end, { noremap = true, silent = true })

-- Obsidian
map("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Obsidian Check Checkbox" })
map("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
map("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })

map("", "<leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- MiniSurround (réassigné sous <m>)
map("n", "<m-sr>", '<cmd>lua require("mini.surround").replace()<CR>', default_opts)
map("n", "<m-sF>", '<cmd>lua require("mini.surround").find_left()<CR>', default_opts)
map("n", "<m-sh>", '<cmd>lua require("mini.surround").highlight()<CR>', default_opts)
map("n", "<m-sf>", '<cmd>lua require("mini.surround").find_right()<CR>', default_opts)
map("n", "<m-sd>", '<cmd>lua require("mini.surround").delete()<CR>', default_opts)
map("n", "<m-sa>", '<cmd>lua require("mini.surround").add()<CR>', default_opts)
map("n", "<m-sn>", '<cmd>lua require("mini.surround").update_n_lines()<CR>', default_opts)

-- Commentaires
map("n", "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', default_opts)
map("n", "<leader>co", '<cmd>lua require("Comment.api").insert.linewise.above()<CR>', default_opts)
map("n", "<leader>cO", '<cmd>lua require("Comment.api").insert.linewise.below()<CR>', default_opts)

-- LSP
map("n", "<leader>ll", '<cmd>lua require("lsp_lines").toggle()<CR>', default_opts)
map("n", "<leader>lg", "<cmd>LazyGit<CR>", default_opts)

-- Gestion des fenêtres
map("n", "<leader>wD", "<cmd>lua vim.diagnostic.open_float()<CR>", default_opts)
map("n", "<leader>wS", '<cmd>lua require("hydra").window_hydra()<CR>', default_opts)
map("n", "<leader>wm", "<cmd>MaximizerToggle<CR>", default_opts)

-- Git
map("n", "<leader>gg", "<cmd>Git<CR>", default_opts)
map("n", "<leader>gl", "<cmd>LazyGit<CR>", default_opts)
map("n", "<leader>gb", "<cmd>Git blame<CR>", default_opts)
map("n", "<leader>gs", "<cmd>Git status<CR>", default_opts)
map("n", "<leader>gc", "<cmd>Git commit<CR>", default_opts)

-- Terminal
map("n", "<leader>tt", "<cmd>terminal<CR>", default_opts)
map("n", "<leader>tl", '<cmd>lua require("myplugin").run_last()<CR>', default_opts)

-- Fichiers
map("n", "<leader>fo", "<cmd>Neotree toggle<CR>", default_opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", default_opts)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", default_opts)

-- Mode visuel
map("x", "<leader>a", '<cmd>lua require("surround").surround_add()<CR>', default_opts)
map("x", "<leader>i", '<cmd>lua require("surround").surround_add()<CR>', default_opts)

-- Mode opérateur
map("o", "<leader>a", '<cmd>lua require("surround").surround_add()<CR>', default_opts)
map("o", "<leader>i", '<cmd>lua require("surround").surround_add()<CR>', default_opts)
