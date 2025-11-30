return {
	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "python" }, -- etc
		lazy = true,
		config = function()
			-- Keymap for Conjure
			vim.keymap.set(
				"n",
				"<localleader>rs",
				":ConjureEval (component-repl/reset)",
				{ desc = "[R]efresh [S]ystem" }
			)
		end,
	},

	-- cmp-conjure works with blink.cmp via blink.compat compatibility layer
	{
		"PaterJason/cmp-conjure",
		-- Ensure blink.compat loads first to provide cmp compatibility shim
		dependencies = { "saghen/blink.compat" },
		ft = { "clojure", "fennel", "python" },
		lazy = true,
		-- Load after blink.compat has initialized
		after = { "blink.compat" },
		-- Prevent the after/plugin file from running if it causes errors
		-- The source is already configured in blink.lua sources
		config = function()
			-- The after/plugin file might try to use nvim-cmp API
			-- If blink.compat provides full compatibility, it should work
			-- Otherwise, the source is already added in blink.lua
		end,
	},
}
