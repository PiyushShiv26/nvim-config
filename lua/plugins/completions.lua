return {
	{
		"github/copilot.vim",
		init = function()
			vim.g.copilot_enabled = 0
		end,
		config = function()
			vim.keymap.set("n", "<leader>cop", function()
				if vim.g.copilot_enabled == 1 then
					vim.cmd("Copilot disable")
					print("Copilot Disabled")
				else
					vim.cmd("Copilot enable")
					print("Copilot Enabled")
				end
			end, {
				noremap = true,
				silent = true,
				desc = "Toggle Copilot",
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter", -- Load only when entering insert mode
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					-- { name = 'nvim_lsp' },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
