return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", "ts_ls", "html", "cssls", "pyright",
					"jdtls", "clangd", "tailwindcss", "emmet_ls",
					"jsonls", "gopls", "rust_analyzer",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local navic = require("nvim-navic")

			local servers = {
				"lua_ls", "ts_ls", "html", "cssls", "pyright",
				"jdtls", "clangd", "tailwindcss", "emmet_ls",
				"jsonls", "gopls", "rust_analyzer",
			}

			-- Using your provided code block. This is the correct pattern.
			for _, server_name in ipairs(servers) do
				vim.lsp.config(server_name, {
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						if client.server_capabilities.documentSymbolProvider then
							navic.attach(client, bufnr)
						end

						-- Attaching keymaps here is still best practice
						local bufopts = { noremap = true, silent = true, buffer = bufnr }
						vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
						vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
					end,
				})
			end

			vim.keymap.set("n", "<leader>o", vim.lsp.buf.document_symbol, { desc = "Document Outline" })

			vim.diagnostic.config({
				virtual_text = false,
				signs = false,
				underline = false,
				update_in_insert = false,
			})
		end,
	},
}
