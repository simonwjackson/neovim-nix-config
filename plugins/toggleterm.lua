-- A terminal emulator for Neovim with first class terminal and job support.

return {
	{
		name = "toggleterm",
		dir = "@toggleterm@",
		config = function()
			require("toggleterm").setup()
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<A-Esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "kl", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "lk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<A-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<A-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
		keys = {
			{
				"<A-.>",
				"<CMD>ToggleTerm direction=vertical name=toggleterm<CR>",
				mode = { "n", "t", "x", "v" },
				desc = "Vertical Split Terminal",
			},
		},
	},
}
