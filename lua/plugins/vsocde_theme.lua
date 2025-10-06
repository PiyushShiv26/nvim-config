return {
	"Mofiqul/vscode.nvim",
	config = function()
		vim.cmd("colorscheme vscode")
		vim.o.background = "dark"
		local c = require("vscode.colors").get_colors()
		require("vscode").setup({
			underline_links = true,
		})
	end,
}
