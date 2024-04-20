vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.lsp.start({
			name = "bash",
			cmd = { "@bashLanguageServer@", "start" },
			settings = {
				bashIde = {
					-- Glob pattern for finding and parsing shell script files in the workspace.
					-- Used by the background analysis features across files.

					-- Prevent recursive scanning which will cause issues when opening a file
					-- directly in the home directory (e.g. ~/foo.sh).
					--
					-- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
					globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
				},
			},
			filetypes = { "sh" },
			root_dir = vim.fs.dirname(vim.fs.find({
				".git",
			}, { upward = true })[1]),
			single_file_support = true,
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

return {}
