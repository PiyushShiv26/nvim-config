return {
	{
		"kdheepak/lazygit.nvim",

		cmd = {
			"LazyGit",
		},

		keys = {
			{ "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open Lazygit (TUI Dashboard)" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
}
