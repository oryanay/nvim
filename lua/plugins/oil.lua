return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },

	keys = {
		{
			"-",
			"<CMD>Oil<CR>",
			desc = "Open parent directory",
		},
	},
	config = function()
		-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		require("oil").setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = true,
		})
	end,
	lazy = false,
}
