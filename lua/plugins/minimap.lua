return {
	"gorbit99/codewindow.nvim",
	config = function()
		local codewindow = require("codewindow")
		codewindow.setup({
			auto_enable = true,
			minimap_width = 10,
			use_lsp_diagnostics = true,
			relative = "editor",
			width_multiplier = 1,
		})

		-- Toggle with <leader>m
		vim.keymap.set("n", "<leader>m", function()
			codewindow.toggle_minimap()
		end, { desc = "Toggle minimap" })
	end,
}
