local opt = vim.opt
local g = vim.g
local api = vim.api
local cmd = vim.api.nvim_command

return {

	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	-- 	opts = {},
	-- },
	{
		name = "obsidian",
		dir = "@obsidian@",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		--   "BufReadPre path/to/my-vault/**.md",
		--   "BufNewFile path/to/my-vault/**.md",
		-- },
		dependencies = {
			-- Required.
			{
				dir = "@plenary@",
				name = "plenary",
			},

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "/glacier/snowscape/notes",
				},
			},

			-- see below for full list of options 👇
		},
	},
	{
		name = "buffdelete",
		dir = "@buffDelete@",
	},
	{
		name = "telescope-tabs",
		dir = "@telescopeTabs@",
		config = function()
			require("telescope").load_extension("telescope-tabs")
			require("telescope-tabs").setup({
				-- Your custom config :^)
			})
		end,
		keys = {
			{
				"<leader>t",
				function()
					require("telescope-tabs").list_tabs()
				end,
				desc = "Show all tabs",
			},
		},
		dependencies = {
			{
				name = "telescope",
				dir = "@telescope@",
			},
		},
	},
	{
		name = "windows",
		dir = "@windows@",
		dependencies = {
			{
				dir = "@middleclass@",
				name = "middleclass",
			},
			{
				dir = "@animation@",
				name = "animation",
			},
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false

			require("windows").setup()
		end,
	},
	-- {
	-- 	"nvim-zh/colorful-winsep.nvim",
	-- 	config = true,
	-- 	event = { "WinNew" },
	-- },
	{
		dir = "@smartSplits@",
		name = "smart-splits",
		keys = {
			-- require('smart-splits').move_cursor_down()
			-- require('smart-splits').move_cursor_left()
			-- require('smart-splits').move_cursor_right()
			{
				"<A-k>",
				function()
					require("smart-splits").move_cursor_up({
						at_edge = "wrap",
					})
				end,
				desc = "Move to split: up",
			},

			{
				"<A-l>",
				function()
					require("smart-splits").move_cursor_right({
						at_edge = "wrap",
					})
				end,
				desc = "Move to split: right",
			},

			{
				"<A-j>",
				function()
					require("smart-splits").move_cursor_down({
						at_edge = "wrap",
					})
				end,
				desc = "Move to split: down",
			},

			{
				"<A-h>",
				function()
					require("smart-splits").move_cursor_left({
						at_edge = "wrap",
					})
				end,
				desc = "Move to split: left",
			},

			{
				"<A-K>",
				function()
					require("smart-splits").swap_buf_up({ move_cursor = true })
				end,
				desc = "Swap split up",
			},
			{
				"<A-L>",
				function()
					require("smart-splits").swap_buf_right({ move_cursor = true })
				end,
				desc = "Swap split right",
			},
			{
				"<A-J>",
				function()
					require("smart-splits").swap_buf_down({ move_cursor = true })
				end,
				desc = "Swap split down",
			},
			{
				"<A-H>",
				function()
					require("smart-splits").swap_buf_left({ move_cursor = true })
				end,
				desc = "Swap split left",
			},
		},
		opts = {
			-- Ignored buffer types (only while resizing)
			ignored_buftypes = {
				"nofile",
				"quickfix",
				"prompt",
			},
			-- Ignored filetypes (only while resizing)
			ignored_filetypes = { "NvimTree" },
			-- the default number of lines/columns to resize by at a time
			default_amount = 3,
			-- Desired behavior when your cursor is at an edge and you
			-- are moving towards that same edge:
			-- 'wrap' => Wrap to opposite side
			-- 'split' => Create a new split in the desired direction
			-- 'stop' => Do nothing
			-- function => You handle the behavior yourself
			-- NOTE: If using a function, the function will be called with
			-- a context object with the following fields:
			-- {
			--    mux = {
			--      type:'tmux'|'wezterm'|'kitty'
			--      current_pane_id():number,
			--      is_in_session(): boolean
			--      current_pane_is_zoomed():boolean,
			--      -- following methods return a boolean to indicate success or failure
			--      current_pane_at_edge(direction:'left'|'right'|'up'|'down'):boolean
			--      next_pane(direction:'left'|'right'|'up'|'down'):boolean
			--      resize_pane(direction:'left'|'right'|'up'|'down'):boolean
			--      split_pane(direction:'left'|'right'|'up'|'down',size:number|nil):boolean
			--    },
			--    direction = 'left'|'right'|'up'|'down',
			--    split(), -- utility function to split current Neovim pane in the current direction
			--    wrap(), -- utility function to wrap to opposite Neovim pane
			-- }
			-- NOTE: `at_edge = 'wrap'` is not supported on Kitty terminal
			-- multiplexer, as there is no way to determine layout via the CLI
			at_edge = "wrap",
			-- when moving cursor between splits left or right,
			-- place the cursor on the same row of the *screen*
			-- regardless of line numbers. False by default.
			-- Can be overridden via function parameter, see Usage.
			move_cursor_same_row = false,
			-- whether the cursor should follow the buffer when swapping
			-- buffers by default; it can also be controlled by passing
			-- `{ move_cursor = true }` or `{ move_cursor = false }`
			-- when calling the Lua function.
			cursor_follows_swapped_bufs = false,
			-- resize mode options
			resize_mode = {
				-- key to exit persistent resize mode
				quit_key = "<ESC>",
				-- keys to use for moving in resize mode
				-- in order of left, down, up' right
				resize_keys = { "h", "j", "k", "l" },
				-- set to true to silence the notifications
				-- when entering/exiting persistent resize mode
				silent = false,
				-- must be functions, they will be executed when
				-- entering or exiting the resize mode
				hooks = {
					on_enter = nil,
					on_leave = nil,
				},
			},
			-- ignore these autocmd events (via :h eventignore) while processing
			-- smart-splits.nvim computations, which involve visiting different
			-- buffers and windows. These events will be ignored during processing,
			-- and un-ignored on completed. This only applies to resize events,
			-- not cursor movement events.
			ignored_events = {
				"BufEnter",
				"WinEnter",
			},
			-- enable or disable a multiplexer integration;
			-- automatically determined, unless explicitly disabled or set,
			-- by checking the $TERM_PROGRAM environment variable,
			-- and the $KITTY_LISTEN_ON environment variable for Kitty
			multiplexer_integration = nil,
			-- disable multiplexer navigation if current multiplexer pane is zoomed
			-- this functionality is only supported on tmux and Wezterm due to kitty
			-- not having a way to check if a pane is zoomed
			disable_multiplexer_nav_when_zoomed = true,
			-- Supply a Kitty remote control password if needed,
			-- or you can also set vim.g.smart_splits_kitty_password
			-- see https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
			kitty_password = nil,
			-- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
			log_level = "info",
		},
	},
	-- Might not work with flash
	-- {
	-- 	"roobert/surround-ui.nvim",
	-- 	dependencies = {
	-- 		"kylechui/nvim-surround",
	-- 		"folke/which-key.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("surround-ui").setup({
	-- 			root_key = "S",
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"rasulomaroff/reactive.nvim",
	-- 	opts = {
	-- 		builtin = {
	-- 			cursorline = true,
	-- 			cursor = false,
	-- 			modemsg = false,
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"miversen33/sunglasses.nvim",
	-- 	config = true,
	-- 	opts = {
	-- 		filter_type = "NOSYNTAX",
	-- 		filter_percent = 0.65,
	-- 	},
	-- },
	-- {
	-- 	"folke/twilight.nvim",
	-- 	opts = {
	-- 		dimming = {
	-- 			alpha = 0.66, -- amount of dimming
	-- 			-- we try to get the foreground from the highlight groups or fallback color
	-- 			color = { "Normal", "#ffffff" },
	-- 			term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
	-- 			inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
	-- 		},
	-- 		context = 10, -- amount of lines we will try to show around the current line
	-- 		treesitter = true, -- use treesitter when available for the filetype
	-- 		-- treesitter is used to automatically expand the visible text,
	-- 		-- but you can further control the types of nodes that should always be fully expanded
	-- 		expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
	-- 			"function",
	-- 			"method",
	-- 			"table",
	-- 			"if_statement",
	-- 		},
	-- 		exclude = {}, -- exclude these filetypes
	-- 	},
	-- },

	-- INFO: Needs some color tweaks
	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- 	-- optional, but required for fuzzy finder support
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 	},
	-- },
	-- {
	-- 	"b0o/incline.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		local helpers = require("incline.helpers")
	-- 		local devicons = require("nvim-web-devicons")
	-- 		require("incline").setup({
	-- 			window = {
	-- 				padding = 0,
	-- 				margin = { horizontal = 0 },
	-- 			},
	-- 			render = function(props)
	-- 				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
	-- 				if filename == "" then
	-- 					filename = "[No Name]"
	-- 				end
	-- 				local ft_icon, ft_color = devicons.get_icon_color(filename)
	-- 				local modified = vim.bo[props.buf].modified
	-- 				return {
	-- 					ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
	-- 						or "",
	-- 					" ",
	-- 					{ filename, gui = modified and "bold,italic" or "bold" },
	-- 					" ",
	-- 					guibg = "#44406e",
	-- 				}
	-- 			end,
	-- 		})
	-- 	end,
	-- 	-- Optional: Lazy load Incline
	-- 	event = "VeryLazy",
	-- },

	{
		dir = "@neodim@",
		name = "neodim",
		event = "LspAttach",
		config = function()
			require("neodim").setup({
				refresh_delay = 75,
				alpha = 0.75,
				blend_color = "#000000",
				hide = {
					underline = true,
					virtual_text = true,
					signs = true,
				},
				regex = {
					"[uU]nused",
					"[nN]ever [rR]ead",
					"[nN]ot [rR]ead",
				},
				priority = 128,
				disable = {},
			})
		end,
	},
	{
		dir = "@mkdir@",
		name = "mkdir",
	},
	-- TODO: Needs some tinkering to work in my env
	-- {
	-- 	"willothy/flatten.nvim",
	-- 	lazy = false,
	-- 	config = true,
	-- 	priority = 1001,
	-- },
	{
		dir = "@chainsaw@",
		name = "chainsaw",
	},
	{
		dir = "@pqf@",
		name = "Pretty Quickfix",
	},
	{
		dir = "@overseer@",
		name = "overseer",
		opts = {},
	},
	{
		dir = "@diffview@",
		name = "diffview",
	},
	{
		dir = "@gitBlame@",
		name = "git-blame",
	},
	{
		dir = "@gitDev@",
		name = "git-dev",
		event = "VeryLazy",
		opts = {},
	},

	-- TODO: decide how to avoid 'make'
	-- {
	-- 	"topaxi/gh-actions.nvim",
	-- 	cmd = "GhActions",
	-- 	keys = {
	-- 		{ "<leader>gh", "<cmd>GhActions<cr>", desc = "Open Github Actions" },
	-- 	},
	-- 	-- optional, you can also install and use `yq` instead.
	-- 	build = "make",
	-- 	dependencies = {
	-- 		{
	-- 			dir = "@plenary@",
	-- 			name = "plenary",
	-- 		},
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		require("gh-actions").setup(opts)
	-- 	end,
	-- },

	{
		dir = "@betterEscape@",
		name = "better-escape",
		config = function()
			require("better_escape").setup({
				mapping = { "lk", "kl" }, -- a table with mappings to use
				timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
				-- example(recommended)
				-- keys = function()
				--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
				-- end,
			})
		end,
	},
	{
		dir = "@nvimScrollbar@",
		name = "nvim-scrollbar",
		init = function()
			require("scrollbar").setup({
				show = true,
				show_in_active_only = true,
				set_highlights = true,
				folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
				max_lines = false, -- disables if no. of lines in buffer exceeds this
				hide_if_all_visible = false, -- Hides everything if all lines are visible
				throttle_ms = 100,
				handle = {
					text = " ",
					blend = 50, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
					color = nil,
					color_nr = nil, -- cterm
					highlight = "CursorColumn",
					hide_if_all_visible = true, -- Hides handle if all lines are visible
				},
				marks = {
					Cursor = {
						text = " ",
						priority = 0,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "Normal",
					},
					Search = {
						text = { "-", "=" },
						priority = 1,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "Search",
					},
					Error = {
						text = { "-", "=" },
						priority = 2,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "DiagnosticVirtualTextError",
					},
					Warn = {
						text = { "-", "=" },
						priority = 3,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "DiagnosticVirtualTextWarn",
					},
					Info = {
						text = { "-", "=" },
						priority = 4,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "DiagnosticVirtualTextInfo",
					},
					Hint = {
						text = { "-", "=" },
						priority = 5,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "DiagnosticVirtualTextHint",
					},
					Misc = {
						text = { "-", "=" },
						priority = 6,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "Normal",
					},
					GitAdd = {
						text = "┆",
						priority = 7,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "GitSignsAdd",
					},
					GitChange = {
						text = "┆",
						priority = 7,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "GitSignsChange",
					},
					GitDelete = {
						text = "▁",
						priority = 7,
						gui = nil,
						color = nil,
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "GitSignsDelete",
					},
				},
				excluded_buftypes = {
					"terminal",
				},
				excluded_filetypes = {
					"cmp_docs",
					"cmp_menu",
					"noice",
					"prompt",
					"TelescopePrompt",
				},
				autocmd = {
					render = {
						"BufWinEnter",
						"TabEnter",
						"TermEnter",
						"WinEnter",
						"CmdwinLeave",
						"TextChanged",
						"VimResized",
						"WinScrolled",
					},
					clear = {
						"BufWinLeave",
						"TabLeave",
						"TermLeave",
						"WinLeave",
					},
				},
				handlers = {
					cursor = true,
					diagnostic = true,
					gitsigns = false, -- Requires gitsigns
					handle = true,
					search = false, -- Requires hlslens
					ale = false, -- Requires ALE
				},
			})
		end,
	},
	{
		dir = "@sentiment@",
		name = "sentiment",
		version = "*",
		event = "VeryLazy", -- keep for lazy loading
		opts = {
			-- config
		},
		init = function()
			-- `matchparen.vim` needs to be disabled manually in case of lazy loading
			vim.g.loaded_matchparen = 1
		end,
	},
	{
		name = "numb",
		dir = "@numb@",
		init = function()
			require("numb").setup()
		end,
	},

	{
		dir = "@cutlass@",
		name = "cutlass",
		opts = {
			exclude = {
				"nd",
				"nD",
			},
		},
	},
	-- TODO: Move into telescope file
	{
		dir = "@telescopeUndo",
		name = "telescope-undo",
		dependencies = { -- note how they're inverted to above example
			{
				name = "telescope",
				dir = "@telescope@",
				dependencies = {
					{
						dir = "@plenary@",
						name = "plenary",
					},
				},
			},
		},
		keys = {
			{ -- lazy style key map
				"<leader>u",
				"<cmd>Telescope undo<cr>",
				desc = "undo history",
			},
		},
		opts = {
			-- don't use `defaults = { }` here, do this in the main telescope spec
			extensions = {
				undo = {
					-- telescope-undo.nvim config, see below
				},
				-- no other extensions here, they can have their own spec too
			},
		},
		config = function(_, opts)
			-- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
			-- configs for us. We won't use data, as everything is in it's own namespace (telescope
			-- defaults, as well as each extension).
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},
	{
		dir = "@boole@",
		name = "boole",
		init = function()
			require("boole").setup({
				mappings = {
					increment = "<C-a>",
					decrement = "<C-x>",
				},
				-- User defined loops
				additions = {
					{ "Foo", "Bar" },
					{ "tic", "tac", "toe" },
				},
				allow_caps_additions = {
					{ "enable", "disable" },
					-- enable → disable
					-- Enable → Disable
					-- ENABLE → DISABLE
				},
			})
		end,
	},
	{
		dir = "@nvimSpectre@",
		name = "spectre",
		keys = {
			{
				"<leader>S",
				function()
					require("spectre").toggle()
				end,
				desc = "Toggle Spectre",
			},
			{
				"<leader>rw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				desc = "Search current word",
			},
			{
				"<leader>rw",
				function()
					require("spectre").open_visual()
				end,
				mode = "v",
				desc = "Search current word",
			},
			{
				"<leader>rp",
				function()
					require("spectre").open_file_search({ select_word = true })
				end,
				desc = "Search on current file",
			},
		},
		opts = {
			color_devicons = true,
			open_cmd = "vnew",
			live_update = false, -- auto execute search again when you write to any file in vim
			lnum_for_results = true, -- show line number for search/replace results
			line_sep_start = "┌-----------------------------------------",
			result_padding = "¦  ",
			line_sep = "└-----------------------------------------",
			highlight = {
				ui = "String",
				search = "DiffChange",
				replace = "DiffDelete",
			},
			mapping = {
				["tab"] = {
					map = "<Tab>",
					cmd = "<cmd>lua require('spectre').tab()<cr>",
					desc = "next query",
				},
				["shift-tab"] = {
					map = "<S-Tab>",
					cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
					desc = "previous query",
				},
				["toggle_line"] = {
					map = "dd",
					cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
					desc = "toggle item",
				},
				["enter_file"] = {
					map = "<cr>",
					cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
					desc = "open file",
				},
				["send_to_qf"] = {
					map = "<leader>q",
					cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
					desc = "send all items to quickfix",
				},
				["replace_cmd"] = {
					map = "<leader>c",
					cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
					desc = "input replace command",
				},
				["show_option_menu"] = {
					map = "<leader>o",
					cmd = "<cmd>lua require('spectre').show_options()<CR>",
					desc = "show options",
				},
				["run_current_replace"] = {
					map = "<leader>rc",
					cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
					desc = "replace current line",
				},
				["run_replace"] = {
					map = "<leader>R",
					cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
					desc = "replace all",
				},
				["change_view_mode"] = {
					map = "<leader>v",
					cmd = "<cmd>lua require('spectre').change_view()<CR>",
					desc = "change result view mode",
				},
				["change_replace_sed"] = {
					map = "trs",
					cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
					desc = "use sed to replace",
				},
				["change_replace_oxi"] = {
					map = "tro",
					cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
					desc = "use oxi to replace",
				},
				["toggle_live_update"] = {
					map = "tu",
					cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
					desc = "update when vim writes to file",
				},
				["toggle_ignore_case"] = {
					map = "ti",
					cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
					desc = "toggle ignore case",
				},
				["toggle_ignore_hidden"] = {
					map = "th",
					cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
					desc = "toggle search hidden",
				},
				["resume_last_search"] = {
					map = "<leader>l",
					cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
					desc = "repeat last search",
				},
				-- you can put your mapping here it only use normal mode
			},
			find_engine = {
				-- rg is map with finder_cmd
				["rg"] = {
					cmd = "rg",
					-- default args
					args = {
						"--pcre2",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
					},
					options = {
						["ignore-case"] = {
							value = "--ignore-case",
							icon = "[I]",
							desc = "ignore case",
						},
						["hidden"] = {
							value = "--hidden",
							desc = "hidden file",
							icon = "[H]",
						},
						-- you can put any rg search option you want here it can toggle with
						-- show_option function
					},
				},
				["ag"] = {
					cmd = "ag",
					args = {
						"--vimgrep",
						"-s",
					},
					options = {
						["ignore-case"] = {
							value = "-i",
							icon = "[I]",
							desc = "ignore case",
						},
						["hidden"] = {
							value = "--hidden",
							desc = "hidden file",
							icon = "[H]",
						},
					},
				},
			},
			replace_engine = {
				["sed"] = {
					cmd = "sed",
					args = nil,
					options = {
						["ignore-case"] = {
							value = "--ignore-case",
							icon = "[I]",
							desc = "ignore case",
						},
					},
				},
				-- call rust code by nvim-oxi to replace
				["oxi"] = {
					cmd = "oxi",
					args = {},
					options = {
						["ignore-case"] = {
							value = "i",
							icon = "[I]",
							desc = "ignore case",
						},
					},
				},
				["sd"] = {
					cmd = "sd",
					options = {},
				},
			},
			default = {
				find = {
					--pick one of item in find_engine
					cmd = "rg",
					options = { "ignore-case" },
				},
				replace = {
					--pick one of item in replace_engine
					cmd = "sed",
				},
			},
			replace_vim_cmd = "cdo",
			is_open_target_win = true, --open file on opener window
			is_insert_mode = false, -- start open panel on is_insert_mode
			is_block_ui_break = false, -- mapping backspace and enter key to avoid ui break
			open_template = {
				-- an template to use on open function
				-- see the 'custom function' section below to learn how to configure the template
				-- { search_text = 'text1', replace_text = '', path = "" }
			},
		},
	},

	{
		dir = "@rosePine@",
		name = "rose-pine",
	},

	-- Vim sugar for the UNIX shell commands
	{
		dir = "@nvimGenghis@",
		name = "nvim-genghis",
		dependencies = {
			dir = "@dressing@",
			name = "dressing",
		},
	},

	-- Start a * or # search from a visual selection
	{
		name = "vim-visual-star-search",
		dir = "@vimVisualStarSearch@",
	},

	-- Visually select increasingly larger regions of text
	{
		name = "vim-expand-region",
		dir = "@vimExpandRegion@",
	},

	-- Incremental search improved in Vim
	{
		dir = "@isVim@",
		name = "is-vim",
		lazy = false,
	},

	-- Show function signature when you type
	{
		dir = "@lspSignature@",
		name = "LSP Signature",
		lazy = false,
	},

	-- Surroundings in Neovim with ease
	{
		dir = "@surround@",
		name = "surround",
		lazy = false,
		config = function()
			-- require("plugins.configs.")
		end,
	},

	-- A dark One Color Scheme for Neovim >0.5 written in Lua.
	{
		name = "onedark",
		dir = "@oneDark@",
		init = function()
			require("onedark").setup({
				-- Main options --
				-- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				style = "cool",
				transparent = true, -- Show/hide background
				term_colors = true, -- Change terminal color as per the selected theme style
				ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

				-- Lualine options --
				lualine = {
					transparent = true, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = true, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			})
			require("onedark").load()
		end,
	},
	{
		name = "highlightedyank",
		dir = "@vimHighlightedyank@",
	},
}
