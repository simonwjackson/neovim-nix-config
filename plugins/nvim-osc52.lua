-- This plugin enables OSC 52 support in Neovim, allowing yanking to the system clipboard.

return {
	{
		dir = "@osc52@",
		name = "osc52",
		init = function()
			require("osc52").setup({
				max_length = 0, -- Maximum length of selection (0 for no limit)
				silent = false, -- Disable message on successful copy
				trim = true, -- Trim surrounding whitespaces before copy
				tmux_passthrough = true, -- Copy from tmux into vim
			})

			-- yy, yw, yiW, y<motion> will yank to system clipboard. cw or dw won't
			vim.api.nvim_create_autocmd("TextYankPost", {
				callback = function()
					if vim.v.event.operator == "y" and vim.v.event.regname == "" then
						require("osc52").copy_register("0")
						-- vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
					end
				end,
			})
		end,
	},
}
