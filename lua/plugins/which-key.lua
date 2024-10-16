return {
	"folke/which-key.nvim",
	lazy = true,
	event = "VimEnter", -- Sets the loading event to VimEnter
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").register({
			{ "", group = "[D]ocument" },
			{ "", group = "[R]ename" },
			{ "", group = "[S]earch" },
			{ "", group = "[B]uffer" },
			{ "", group = "[W]orkspace" },
			{ "", group = "[C]ode" },
			{ "", desc = "", hidden = true, mode = { "n", "n", "n", "n", "n", "n" } },
			-- { "", desc = "<leader>r_", hidden = true },
			-- { "", group = "[C]ode" },
			-- { "", desc = "<leader>b_", hidden = true },
			-- { "", desc = "<leader>c_", hidden = true },
			-- { "", group = "[D]ocument" },
			-- { "", desc = "<leader>d_", hidden = true },
			-- { "", group = "[B]uffer" },
			-- { "", group = "[W]orkspace" },
			-- { "", desc = "<leader>w_", hidden = true },
			-- { "", group = "[S]earch" },
			-- { "", desc = "<leader>s_", hidden = true },
			-- { "", group = "[R]ename" },
		})
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
