-- This plugin enables OSC 52 support in Neovim, allowing yanking to the system clipboard.

return {
	{
		"ojroques/nvim-osc52",
		init = function()
			require("plugins.nvim-osc52")

			vim.keymap.set("n", "yy", "yy", { remap = true })
			vim.keymap.set("n", "dd", "dd", { remap = true })

			function copy()
				if vim.v.event.operator == "y" and (vim.v.event.regname == "" or vim.v.event.regname == "+") then
					require("osc52").copy_register("+")
				end
			end

			vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
		end,
	},
}
