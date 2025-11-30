return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				disable_defaults = false,
				go = "go", -- go command, can be go[default] or go1.18beta1
				goimports = "gopls", -- goimports command, can be gopls[default] or either goimports or golines if need to split long lines
				fillstruct = "gopls", -- default, can also use fillstruct
				gofmt = "gofumpt", -- gofmt cmd,
				-- max_line_len removed: only effective when gofmt is "go", but we use "gofumpt"
				tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
				tag_options = "json=omitempty", -- sets options sent to gomodifytags, i.e., json=omitempty
				gotests_template = "", -- sets gotests -template parameter (check gotests for details)
				gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
				comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. 󰟓
				icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
				verbose = false, -- output loginf in messages
				lsp_cfg = false, -- false: use your own lspconfig
				lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
				lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
				--      when lsp_cfg is true
				-- if lsp_on_attach is a function: use this function as on_attach function for gopls
				lsp_keymaps = false, -- set to false to disable gopls/lsp keymap
				lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
				diagnostic = {
					hdlr = false, -- hook lsp diag handler and send diag to quickfix
					underline = true,
					-- virtual text setup
					virtual_text = { spacing = 0, prefix = "■" },
					signs = true,
					update_in_insert = false,
				},
				lsp_document_formatting = true,
				-- set to true: use gopls to format
				-- false if you want to use other formatter tool(e.g. efm, nulls)
				lsp_inlay_hints = {
					enable = true,
					style = "inlay", -- default: inlay
					only_current_line = false,
					only_current_line_autocmd = "CursorHold",
					show_variable_name = true,
					parameter_hints_prefix = "󰊕 ",
					show_parameter_hints = true,
					other_hints_prefix = "=> ",
					max_len_align = false,
					max_len_align_padding = 1,
					right_align = false,
					right_align_padding = 6,
					highlight = "Comment",
				},
				gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
				gopls_remote_auto = true, -- add -remote=auto to gopls
				gocoverage_sign = "█",
				sign_priority = 5, -- change to a higher number to override other signs
				dap_debug = true, -- set to false to disable dap
				dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
				-- false: do not use keymap in go/dap.lua.  you must define your own.
				-- Windows: Use Visual Studio keymap
				dap_debug_gui = {}, -- bool|table put your dap-ui setup here set to false to disable
				dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

				dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pick up a random port
				dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
				dap_retries = 20, -- see dap option max_retries
				build_tags = "", -- set default build tags
				textobjects = true, -- enable default text jobects through treesittter-text-objects
				test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
				verbose_tests = true, -- set to add verbose flag to tests deprecated, see '-v' option
				run_in_floaterm = false, -- set to true to run in a float window. :GoTermClose closes the floatterm
				-- float term recommend if you use richgo/ginkgo with terminal color

				floaterm = { -- position
					posititon = "auto", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
					width = 0.45, -- width of float window if not auto
					height = 0.98, -- height of float window if not auto
					title_colors = "nord", -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
					-- can also set to a list of colors to define colors to choose from
					-- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
				},
				trouble = false, -- true: use trouble to open quickfix
				test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
				luasnip = false, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
				--  Do not enable this if you already added the path, that will duplicate the entries
			})

			-- Disable go.nvim's format on save since we're using conform.nvim
			-- local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	pattern = "*.go",
			-- 	callback = function()
			-- 		require("go.format").goimports()
			-- 	end,
			-- 	group = format_sync_grp,
			-- })
		end,
		-- Load only for Go files, not on command line entry (which was causing warnings on all files)
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
}

