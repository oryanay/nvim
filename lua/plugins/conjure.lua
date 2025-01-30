return {
	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "python" }, -- etc
		lazy = true,
		dependencies = { "PaterJason/cmp-conjure" },
	},

	{
		"PaterJason/cmp-conjure",
		lazy = true,
		config = function()
			local cmp = require("cmp")
			local config = cmp.get_config()
			table.insert(config.sources, { name = "conjure" })

			vim.keymap.set(
				"n",
				"<localleader>rs",
				":ConjureEval (component-repl/reset)",
				{ desc = "[R]efresh [S]ystem" }
			)
			return cmp.setup(config)
		end,
	},
}
