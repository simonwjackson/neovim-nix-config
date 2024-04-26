-- A small automated session manager for Neovim.

-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

return {
	{
		dir = "@autoSession@",
		name = "auto-session",
		lazy = false,
		opts = {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/downloads" },
		},
	},
}
