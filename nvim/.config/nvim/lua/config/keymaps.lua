local map = LazyVim.safe_keymap_set
local default_opts = { noremap = true, silent = true }

-- map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>w$", "<C-W>v", { desc = "Split Window Right", remap = true })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>$", "<C-W>v", { desc = "Split Window Right", remap = true })
--

map("n", "<leader>xe", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })

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

-- map("", "<leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

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

-- Keymap to switch spelling language to English lamw25wmal
-- To save the language settings configured on each buffer, you need to add
-- "localoptions" to vim.opt.sessionoptions in the `lua/config/options.lua` file
vim.keymap.set("n", "<leader>msle", function()
  vim.opt.spelllang = "en"
  vim.cmd("echo 'Spell language set to English'")
end, { desc = "[P]Spelling language English" })

-- HACK: neovim spell multiple languages
-- https://youtu.be/uLFAMYFmpkE
--
-- Keymap to switch spelling language to Spanish lamw25wmal
vim.keymap.set("n", "<leader>mslf", function()
  vim.opt.spelllang = "fr"
  vim.cmd("echo 'Spell language set to French'")
end, { desc = "[P]Spelling language French" })

-- HACK: neovim spell multiple languages
-- https://youtu.be/uLFAMYFmpkE
--
-- Keymap to switch spelling language to both spanish and english lamw25wmal
vim.keymap.set("n", "<leader>mslb", function()
  vim.opt.spelllang = "en,fr"
  vim.cmd("echo 'Spell language set to French and English'")
end, { desc = "[P]Spelling language French and English" })

-- HACK: neovim spell multiple languages
-- https://youtu.be/uLFAMYFmpkE
--
-- Show spelling suggestions / spell suggestions
vim.keymap.set("n", "<leader>mss", function()
  -- Simulate pressing "z=" with "m" option using feedkeys
  -- vim.api.nvim_replace_termcodes ensures "z=" is correctly interpreted
  -- 'm' is the {mode}, which in this case is 'Remap keys'. This is default.
  -- If {mode} is absent, keys are remapped.
  --
  -- I tried this keymap as usually with
  vim.cmd("normal! 1z=")
  -- But didn't work, only with nvim_feedkeys
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("z=", true, false, true), "m", true)
end, { desc = "[P]Spelling suggestions" })

-- HACK: neovim spell multiple languages
-- https://youtu.be/uLFAMYFmpkE
--
-- markdown good, accept spell suggestion
-- Add word under the cursor as a good word
vim.keymap.set("n", "<leader>msg", function()
  vim.cmd("normal! zg")
end, { desc = "[P]Spelling add word to spellfile" })

-- HACK: neovim spell multiple languages
-- https://youtu.be/uLFAMYFmpkE
--
-- Undo zw, remove the word from the entry in 'spellfile'.
vim.keymap.set("n", "<leader>msu", function()
  vim.cmd("normal! zug")
end, { desc = "[P]Spelling undo, remove word from list" })

-- HACK: neovim spell multiple languages
-- https://youtu.be/uLFAMYFmpkE
--
-- Repeat the replacement done by |z=| for all matches with the replaced word
-- in the current window.
vim.keymap.set("n", "<leader>msr", function()
  -- vim.cmd(":spellr")
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":spellr\n", true, false, true), "m", true)
end, { desc = "[P]Spelling repeat" })

-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", silent = true })
