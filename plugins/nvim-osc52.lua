-- This plugin enables OSC 52 support in Neovim, allowing yanking to the system clipboard.

return {
	{
		"ojroques/nvim-osc52",
		init = function()
			vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

			require("plugins.nvim-osc52")

			vim.keymap.set("n", "yy", "yy", { remap = true })

			function copy()
				if vim.v.event.operator == "y" and (vim.v.event.regname == "" or vim.v.event.regname == "+") then
					require("osc52").copy_register("+")
				end
			end

			vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
		end,
	},
}
