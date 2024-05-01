-- A simple wrapper around git worktree operations, create, switch, and delete

return {
	{
		name = "git-worktree",
		dir = "@gitWorktreeNvim@",
		-- lazy = false,
		init = function()
			require("telescope").load_extension("git_worktree")

			-- Function to check if a file or directory exists
			-- local function file_exists(path)
			-- 	local file = io.open(path, "r")
			-- 	if file then
			-- 		file:close()
			-- 		return true
			-- 	else
			-- 		return false
			-- 	end
			-- end
			--
			-- -- Get Vim's current directory
			-- local current_dir = vim.fn.getcwd()
			--
			-- -- Check if the .git file and .bare folder exist in the current directory
			-- local git_file_path = current_dir .. "/.git"
			-- local bare_folder_path = current_dir .. "/.bare"
			-- local main_branch_path = current_dir .. "/main"
			--
			-- if file_exists(git_file_path) and file_exists(bare_folder_path) and file_exists(main_branch_path) then
			-- 	-- Check if the main worktree branch exists
			-- 	if file_exists(main_branch_path) then
			-- 		-- Change the current directory to the main worktree branch
			-- 		vim.cmd("cd " .. main_branch_path)
			-- 	end
			-- end
		end,
		keys = {
			{
				"<F11>",
				"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
				desc = "List worktrees",
			},
			{
				"<F12>",
				"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
				desc = "Create worktree",
			},
		},
		dependencies = {
			{
				name = "which-key",
				dir = "@whichKeyNvim@",
			},
			{
				name = "plenary",
				dir = "@plenaryNvim@",
			},
			{
				name = "telescope",
				dir = "@telescope@",
			},
		},
	},
}
