return {
	"tpope/vim-fugitive",
	config = function()
		-- Global fugitive keybindings
		vim.keymap.set("n", "<leader>gs", ":G<CR>", { desc = "Git status" })
		vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff split" })
		vim.keymap.set("n", "<leader>gD", ":Gvdiffsplit<CR>", { desc = "Git diff vertical split" })
		vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
		vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
		vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
		vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
		vim.keymap.set("n", "<leader>gP", ":Git pull<CR>", { desc = "Git pull" })
		vim.keymap.set("n", "<leader>gf", ":Git fetch<CR>", { desc = "Git fetch" })
		
		-- Merge conflict resolution
		vim.keymap.set("n", "<leader>g2", ":diffget //2<CR>", { desc = "Get from left (target)" })
		vim.keymap.set("n", "<leader>g3", ":diffget //3<CR>", { desc = "Get from right (merge)" })
		
		-- Disable LSP in fugitive buffers to prevent gopls errors
		vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
			pattern = { "fugitive", "git", "gitcommit", "gitrebase" },
			callback = function()
				vim.diagnostic.disable(0)
				vim.b.copilot_enabled = false  -- Also disable copilot if you have it
			end,
		})
		
		-- Also disable LSP for fugitive:// buffers
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter" }, {
			pattern = { "fugitive://*", "*.git/*" },
			callback = function()
				vim.diagnostic.disable(0)
				vim.defer_fn(function()
					for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
						vim.lsp.buf_detach_client(0, client.id)
					end
				end, 100)
			end,
		})
		
		-- Specifically handle diff splits
		vim.api.nvim_create_autocmd("User", {
			pattern = "FugitiveObject",
			callback = function()
				vim.diagnostic.disable(0)
				vim.b.copilot_enabled = false
				-- Detach all LSP clients
				for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
					vim.lsp.buf_detach_client(0, client.id)
				end
			end,
		})
	end,
}
