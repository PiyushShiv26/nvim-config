return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 15,                -- fixed height for horizontal terminal at bottom
      open_mapping = [[<C-/>]],
      direction = "horizontal", -- always horizontal split (bottom)
      close_on_exit = true,
      float_opts = {
        border = "curved",
        winblend = 3,
      },
      persist_size = true,
    })

    -- LazyGit keymap for floating terminal
    vim.keymap.set(
      "n",
      "<leader>gg",
      "<cmd>ToggleTerm direction=float command=lazygit<CR>",
      { desc = "Open LazyGit UI" }
    )
  end,
}

