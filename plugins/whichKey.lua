--
-- {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   opts = {
--     plugins = { spelling = true },
--     key_labels = { ["<leader>"] = "SPC" },
--   },
--   config = function(_, opts)
--     local wk = require("which-key")
--     wk.setup(opts)
--     wk.register({
--       mode = { "n", "v" },
--       ["g"] = { name = "+goto" },
--       ["]"] = { name = "+next" },
--       ["["] = { name = "+prev" },
--       ["<leader><tab>"] = { name = "+tabs" },
--       ["<leader>b"] = { name = "+buffer" },
--       ["<leader>c"] = { name = "+code" },
--       ["<leader>f"] = { name = "+file/find" },
--       ["<leader>g"] = { name = "+git" },
--       ["<leader>gh"] = { name = "+hunks" },
--       ["<leader>q"] = { name = "+quit/session" },
--       ["<leader>s"] = { name = "+search" },
--       ["<leader>sn"] = { name = "+noice" },
--       ["<leader>u"] = { name = "+ui" },
--       ["<leader>w"] = { name = "+windows" },
--       ["<leader>x"] = { name = "+diagnostics/quickfix" },
--     })
--   end,
-- },
local cmd = vim.api.nvim_command
-- This is a lua version of vim which key that displays available keybindings in popup menu.

return {
	{
		name = "WhichKey",
		dir = "@whichKey@",
		event = "VeryLazy",
		keys = {
			{ "<Esc>", ":noh <CR>", desc = "Clear highlights" },
			{
				"<A-s>",
				[[<C-\><C-n>:silent! !tmux choose-tree<cr>]],
				desc = "show tmux sessions",
				nowait = true,
				mode = { "t", "n" },
			},
		},
		opts = {
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			operators = { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				["<space>"] = "SPC",
				["<cr>"] = "RET",
				["<tab>"] = "TAB",
			},
			motions = {
				count = true,
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			window = {
				border = "double", -- none, single, double, shadow
				position = "top", -- bottom, top
				margin = { 0.1, 0.2, 0, 0.2 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
			show_help = true, -- show a help message in the command line for using WhichKey
			show_keys = true, -- show the currently pressed key and its label as a message in the command line
			triggers = "auto", -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specifiy a list manually
			-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
			triggers_nowait = {
				-- marks
				"`",
				"'",
				"g`",
				"g'",
				-- registers
				'"',
				"<c-r>",
				-- spelling
				"z=",
			},
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for keymaps that start with a native binding
				i = { "j", "k" },
				v = { "j", "k" },
			},
			-- disable the WhichKey popup for certain buf types and file types.
			-- Disabled by default for Telescope
			disable = {
				buftypes = {},
				filetypes = {},
			},
		},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 100
			-- local wk = require("which-key")
			--
			-- local function my_lazygit()
			-- 	cmd("tabnew")
			-- 	cmd("LualineRenameTab LazyGit")
			-- 	cmd("terminal nvr -c 'terminal lazygit' -c 'startinsert' '+let g:auto_session_enabled = v:false'")
			-- end
			--
			-- wk.register({
			-- 	["<A-s>"] = {
			-- 		"<C-\\><C-n>:silent! !tmux choose-tree<cr>",
			-- 		"show tmux sessions",
			-- 		opts = { nowait = true },
			-- 	},
			-- }, { mode = "t" })
			--
			-- wk.register({
			-- 	["<leader>gg"] = { my_lazygit, "Open lazygit", opts = { nowait = true } },
			-- 	["<A-s>"] = { ":silent! !tmux choose-tree<cr>", "show tmux sessions", opts = { nowait = true } },
			-- 	["<A-1>"] = { ":silent! tabn 1<cr>", "Go to tab 1", opts = { nowait = true } },
			-- 	["<A-2>"] = { ":silent! tabn 2<cr>", "Go to tab 2", opts = { nowait = true } },
			-- 	["<A-3>"] = { ":silent! tabn 3<cr>", "Go to tab 3", opts = { nowait = true } },
			-- 	["<A-4>"] = { ":silent! tabn 4<cr>", "Go to tab 4", opts = { nowait = true } },
			-- 	["<A-5>"] = { ":silent! tabn 5<cr>", "Go to tab 5", opts = { nowait = true } },
			-- 	["<A-6>"] = { ":silent! tabn 6<cr>", "Go to tab 6", opts = { nowait = true } },
			-- 	["<A-7>"] = { ":silent! tabn 7<cr>", "Go to tab 7", opts = { nowait = true } },
			-- 	["<A-8>"] = { ":silent! tabn 8<cr>", "Go to tab 8", opts = { nowait = true } },
			-- 	["<A-9>"] = { ":silent! tabn 9<cr>", "Go to tab 9", opts = { nowait = true } },
			-- }, { mode = "n" })
			-- -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
			--
			-- wk.register({
			-- 	["gD"] = {
			-- 		function()
			-- 			vim.lsp.buf.declaration()
			-- 		end,
			-- 		"LSP declaration",
			-- 	},
			--
			-- 	["gd"] = {
			-- 		function()
			-- 			vim.lsp.buf.definition()
			-- 		end,
			-- 		"LSP definition",
			-- 	},
			--
			-- 	["K"] = {
			-- 		function()
			-- 			vim.lsp.buf.hover()
			-- 		end,
			-- 		"LSP hover",
			-- 	},
			--
			-- 	-- ["gi"] = {
			-- 	--   function()
			-- 	--     vim.lsp.buf.implementation()
			-- 	--   end,
			-- 	--   "LSP implementation",
			-- 	-- },
			-- 	--
			-- 	-- ["<leader>ls"] = {
			-- 	--   function()
			-- 	--     vim.lsp.buf.signature_help()
			-- 	--   end,
			-- 	--   "LSP signature help",
			-- 	-- },
			-- 	--
			-- 	-- ["<leader>D"] = {
			-- 	--   function()
			-- 	--     vim.lsp.buf.type_definition()
			-- 	--   end,
			-- 	--   "LSP definition type",
			-- 	-- },
			-- 	--
			-- 	-- ["<leader>ra"] = {
			-- 	--   function()
			-- 	--     require("nvchad_ui.renamer").open()
			-- 	--   end,
			-- 	--   "LSP rename",
			-- 	-- },
			-- 	--
			-- 	-- ["<leader>ca"] = {
			-- 	--   function()
			-- 	--     vim.lsp.buf.code_action()
			-- 	--   end,
			-- 	--   "LSP code action",
			-- 	-- },
			-- 	--
			-- 	-- ["gr"] = {
			-- 	--   function()
			-- 	--     vim.lsp.buf.references()
			-- 	--   end,
			-- 	--   "LSP references",
			-- 	-- },
			-- 	--
			-- 	-- ["<leader>f"] = {
			-- 	--   function()
			-- 	--     vim.diagnostic.open_float({ border = "rounded" })
			-- 	--   end,
			-- 	--   "Floating diagnostic",
			-- 	-- },
			-- 	--
			-- 	["[d"] = {
			-- 		function()
			-- 			vim.diagnostic.goto_prev({ float = { border = "rounded" } })
			-- 		end,
			-- 		"Goto prev",
			-- 	},
			--
			-- 	["]d"] = {
			-- 		function()
			-- 			vim.diagnostic.goto_next({ float = { border = "rounded" } })
			-- 		end,
			-- 		"Goto next",
			-- 	},
			--
			-- 	["<leader>q"] = {
			-- 		function()
			-- 			vim.diagnostic.setloclist()
			-- 		end,
			-- 		"Diagnostic setloclist",
			-- 	},
			-- }, { mode = "n" })
			--
			-- wk.register({
			-- 	-- Don't copy the replaced text after pasting in visual mode
			-- 	-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
			-- 	["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
			-- }, { mode = "x" })
			--
			--
			--
			-- 	-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
			-- 	-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
			-- 	-- empty mode is same as using <cmd> :map
			-- 	-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
			--
			-- 	["j"] = {
			-- 		function()
			-- 			vim.api.nvim_exec(vim.v.count == 0 and "normal! gj" or "normal! j", false)
			-- 		end,
			-- 		"Move up",
			-- 		opts = { expr = true },
			-- 	},
			-- 	["k"] = {
			-- 		function()
			-- 			vim.api.nvim_exec(vim.v.count == 0 and "normal! gk" or "normal! k", false)
			-- 		end,
			-- 		"Move up",
			-- 		opts = { expr = true },
			-- 	},
			--
			-- 	-- new buffer
			-- 	["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
			-- 	["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
			-- })
		end,
	},
}
