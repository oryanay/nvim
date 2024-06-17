return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>e",
			":NvimTreeToggle<CR>",
			desc = "Explorer NeoTree",
		},
	},
	config = function()
		require("nvim-tree").setup({})
	end,
}
