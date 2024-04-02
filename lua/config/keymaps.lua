local keymap = vim.keymap
local opts = {noremap = true, silent = true}
-- Directory Navigation
keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", opts)

-- Pane navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window management
keymap.set("n", "<leader>wv", ":vsplit<CR>", opts) -- Split vertically
keymap.set("n", "<leader>wh", ":split<CR>", opts) -- Split horizontally
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>", opts) -- Toggle minimize

-- Exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

