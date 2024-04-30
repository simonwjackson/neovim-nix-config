-- A terminal emulator for Neovim with first class terminal and job support.

return {
	{
		name = "toggleterm",
		dir = "@toggleterm@",
		init = function()
			require("toggleterm").setup({
				shade_terminals = true,
				persist_size = false,
			})

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

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
			local generic_term = Terminal:new({ name = "toggleterm", direction = "float", hidden = true })

			function __Lazygit_Toggle()
				lazygit:toggle()
			end

			function __GenericTerm_Toggle()
				generic_term:toggle()
			end

			function __Lf_Toggle()
				local filePath = vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand("%:p"), ":!"))
				local lf_term =
					Terminal:new({ cmd = "lf " .. filePath, name = "lf", direction = "float", hidden = true })
				lf_term:toggle()
			end
		end,
		keys = {
			{
				"<A-.>",
				function()
					__GenericTerm_Toggle()
				end,
				mode = { "n", "t", "x", "v" },
				desc = "Vertical Split Terminal",
			},
			{
				"<A-S-.>",
				function()
					local cmd = vim.api.nvim_command

					cmd("tabnew")
					cmd("LualineRenameTab Term")
					cmd("terminal nvr -c 'terminal' -c 'startinsert' '+let g:auto_session_enabled = v:false'")
				end,
				mode = { "n", "t", "x", "v" },
				desc = "Vertical Split Terminal",
			},
			{
				"<leader>fe",
				function()
					__Lf_Toggle()
				end,
				mode = { "n", "x", "v" },
				desc = "File Explorer",
			},

			{
				"<leader>gg",
				function()
					__Lazygit_Toggle()
				end,
				mode = { "n", "x", "v" },
				desc = "Lazygit",
			},
		},
	},
}
