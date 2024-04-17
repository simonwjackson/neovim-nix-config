local opt = vim.opt
local g = vim.g
local api = vim.api
local cmd = vim.api.nvim_command

-- Indenting
opt.expandtab = true
opt.shiftwidth = 22
opt.smartindent = true
opt.tabstop = 22
opt.softtabstop = 22

-- TODO: use flake
local lazypath = vim.fn.stdpath("run") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
