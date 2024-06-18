return {
	"famiu/bufdelete.nvim",
	config = function()
		vim.keymap.set("n", "<leader>bd", "<cmd>Bdelete<cr>", { desc = "Delete buffer" })
	end,
}
