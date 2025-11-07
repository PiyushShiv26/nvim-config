return {
	"iamcco/markdown-preview.nvim",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	ft = { "markdown" },
	cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },

	lazy = false,
}
