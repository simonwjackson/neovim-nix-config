-- A UI for vim-dadbod. It allows you to explore your database using a UI interface and run SQL queries.

return {
	{
		name = "vim-dadbod-ui",
		dir = "@vimDadbodUi@",
		dependencies = {
			{
				name = "vim-dadbod",
				dir = "@vimDadbod@",
				lazy = true,
			},
			{
				dir = "@vimDadbodCompletion@",
				name = "vim-dadbod-completion",
				ft = { "sql", "mysql", "plsql" },
				lazy = true,
			},
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
