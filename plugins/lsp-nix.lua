vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.nix",
	callback = function()
		vim.lsp.start({
			name = "nixd",
			cmd = { "@nixd@" },
			filetypes = { "nix" },
			root_dir = vim.fs.dirname(vim.fs.find({
				".nixd.json",
				"flake.nix",
				".git",
			}, { upward = true })[1]),
			single_file_support = true,
			log_level = vim.lsp.protocol.MessageType.Warning,
		})
	end,
})

return {}
