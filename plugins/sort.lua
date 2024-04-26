-- A simple sort utility for Neovim.

return {
	{
		dir = "@sort@",
		name = "sort",
		lazy = false,
		opts = {
			delimiters = {
				",",
				"|",
				";",
				":",
				"s", -- Space
				"t", -- Tab
			},
		},
	},
}
