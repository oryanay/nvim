return {

	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				clojure = { "clj-kondo" },
				text = { "vale" },
				json = { "jsonlint" },
				python = { "ruff" },
				go = { "golangcilint" },
			}

			-- Override golangci-lint to run from the module root
			lint.linters.golangcilint = {
				cmd = "golangci-lint",
				stdin = false,
				append_fname = false,
				args = { "run", "--out-format", "json" },
				stream = "both",
				ignore_exitcode = true,
				env = nil,
				parser = require("lint.parser").from_pattern(
					[[(%w+):(%d+):(%d+): (.+)]],
					{ "file", "lnum", "col", "message" }
				),
			}

			-- Create autocommand which carries out the actual linting
			-- on the specified events.
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- Only run the linter in buffers that you can modify in order to
					-- avoid superfluous noise, notably within the handy LSP pop-ups that
					-- describe the hovered symbol using Markdown.
					if vim.opt_local.modifiable:get() then
						if vim.bo.filetype == "go" then
							-- Find the nearest go.mod file
							local go_mod_path = vim.fn.findfile("go.mod", ".;")
							if go_mod_path == "" then
								return -- Skip if no go.mod found
							end
							
							-- Get the directory containing go.mod
							local module_root = vim.fn.fnamemodify(go_mod_path, ":h")
							
							-- Save current directory and change to module root
							local cwd = vim.fn.getcwd()
							vim.fn.chdir(module_root)
							
							-- Run the linter
							lint.try_lint()
							
							-- Restore original directory
							vim.fn.chdir(cwd)
						else
							lint.try_lint()
						end
					end
				end,
			})
		end,
	},
}
