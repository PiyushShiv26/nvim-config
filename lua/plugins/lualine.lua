return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "vscode",
			},
			sections = {
				lualine_c = {
					"branch",
					{
						"filename",
						path = 1, -- 1 = relative path (breadcrumb style), 2 = absolute path
					},
				},
			},
		})
	end,
}
