local map = LazyVim.safe_keymap_set
--
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
map("n", "sh", "<C-w>h", { noremap = true })
map("n", "sk", "<C-w>k", { noremap = true })
map("n", "sj", "<C-w>j", { noremap = true })
map("n", "sl", "<C-w>l", { noremap = true })

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
