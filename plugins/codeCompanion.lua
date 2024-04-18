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
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- Optional
			{
				"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
				opts = {},
			},
		},
	},
}
