return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function move_to_trash(path)
			vim.fn.system({ "trash", vim.fn.fnameescape(path) })
		end

		require("neo-tree").setup({
			close_if_last_window = false,

			window = {
				position = "left",
				width = 30,
			},
			filesystem = {
				git_status_info = true,
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				window = {
					open_files_in = "current_window",
				},
				commands = {
					delete = function(state)
						local inputs = require("neo-tree.ui.inputs")
						local path = state.tree:get_node().path
						local msg = "Are you sure you want to move to Trash: " .. path
						inputs.confirm(msg, function(confirmed)
							if not confirmed then
								return
							end
							move_to_trash(path)
							require("neo-tree.sources.manager").refresh(state.name)
						end)
					end,
					delete_visual = function(state, selected_nodes)
						local inputs = require("neo-tree.ui.inputs")
						local msg = "Are you sure you want to move to Trash " .. #selected_nodes .. " items?"
						inputs.confirm(msg, function(confirmed)
							if not confirmed then
								return
							end
							for _, node in ipairs(selected_nodes) do
								move_to_trash(node.path)
							end
							require("neo-tree.sources.manager").refresh(state.name)
						end)
					end,
				},
			},
		})

		vim.keymap.set("n", "<C-n>", function()
			require("neo-tree.command").execute({ action = "focus", source = "filesystem" })
		end, { silent = true, desc = "Focus Neo-tree" })
	end,
}
