local keymap = vim.keymap
local opts = { noremap = true, silent = true }
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
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Move line in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy to clipboard
keymap.set("x", "<leader>p", '"_dP')
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- Delete skip buffer
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- lazy
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
