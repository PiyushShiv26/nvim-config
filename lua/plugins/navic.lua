return {
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("nvim-navic").setup({
				highlight = true,
				separator = " > ",
			})
			vim.keymap.set("n", "<leader>r", "<cmd>Lazy sync<CR>", { desc = "Sync plugins" })
		end,
	},
}
