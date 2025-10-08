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
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"pyright",
					"jdtls",
					"clangd",
					"tailwindcss",
					"emmet_ls",
					"jsonls",
					"gopls",
					"rust_analyzer",
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
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"pyright",
				"jdtls",
				"clangd",
				"tailwindcss",
				"emmet_ls",
				"jsonls",
				"gopls",
				"rust_analyzer",
			}

			-- Using your provided code block. This is the correct pattern.
			for _, server_name in ipairs(servers) do
				local server_opts = {
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						if client.server_capabilities.documentSymbolProvider then
							navic.attach(client, bufnr)
						end

						local bufopts = { noremap = true, silent = true, buffer = bufnr }
						vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
						vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
					end,
				}

				if server_name == "lua_ls" then
					server_opts.settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim", "require" },
							},
							workspace = {
								checkThirdParty = true,
							},
							telemetry = {
								enable = false,
							},
						},
					}
				end
				vim.lsp.config(server_name, server_opts)
			end

			vim.keymap.set("n", "<leader>o", vim.lsp.buf.document_symbol, { desc = "Document Outline" })

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = true,

				severity_sort = true,
				float = {
					source = "always",
					border = "rounded",
				},
			})
		end,
	},
}
