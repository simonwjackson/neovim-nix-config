return {
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	-- 	opts = {},
	-- },
	{
		"epwalsh/obsidian.nvim",
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
	{ "famiu/bufdelete.nvim" },
	{
		"LukasPietzschmann/telescope-tabs",
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
				name = "Telescope",
				dir = "@telescope@",
			},
		},
	},
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
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
		"mrjones2014/smart-splits.nvim",
		keys = {
			{
				"<A-Esc>",
				function()
					vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
				end,
				desc = "Escape terminal mode",
			},
			{
				"<A-K>",
				function()
					require("smart-splits").swap_buf_up()
				end,
				desc = "Swap split up",
			},
			{
				"<A-L>",
				function()
					require("smart-splits").swap_buf_right()
				end,
				desc = "Swap split right",
			},
			{
				"<A-J>",
				function()
					require("smart-splits").swap_buf_down()
				end,
				desc = "Swap split down",
			},
			{
				"<A-H>",
				function()
					require("smart-splits").swap_buf_up()
				end,
				desc = "Swap split up",
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
}
