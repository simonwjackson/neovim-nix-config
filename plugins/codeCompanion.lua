return {
	{
		dir = "@codeCompanion@",
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = "anthropic",
					inline = "anthropic",
				},
				adapters = {
					anthropic = require("codecompanion.adapters").use("anthropic", {
						schema = {
							model = {
								default = "claude-3-opus-20240229",
							},
						},
					}),
				},
			})
		end,
		dependencies = {
			{
				name = "Edgy.nvim",
				dir = "@edgyNvim@",
				event = "VeryLazy",
				init = function()
					vim.opt.laststatus = 3
					vim.opt.splitkeep = "screen"
				end,
				opts = {
					right = {
						{ ft = "codecompanion", title = "Code Companion Chat", size = { width = 0.45 } },
					},
				},
			},
			{
				name = "plenary.nvim",
				dir = "@plenaryNvim@",
			},
			{
				name = "Treesitter - Yaml",
				dir = "@treesitterYaml@",
			},
			{
				name = "Telescope",
				dir = "@telescope@",
			},
			{
				name = "Dressing.nvim",
				dir = "@dressing@", -- Optional: Improves the default Neovim UI
				opts = {},
			},
		},
	},
}
