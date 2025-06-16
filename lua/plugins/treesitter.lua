-- Highlight, edit, and navigate code
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"c",
				"python",
				"lua",
				"luadoc",
				"query",
				"markdown",
				"vim",
				"vimdoc",
				"rust",
				"clojure",
				"kotlin",
				"java",
				"javascript",
				"typescript",
				"json",
				"jsonc",
				"tsx",
				"css",
				"norg",
				"scss",
				"svelte",
				"typst",
				"vue",
			},
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
			-- autotag = { enable = true },
		},

		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true

			--@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
		event = { "BufReadPre", "BufNewFile", "BufReadPost", "BufWritePre" },
	},
}
