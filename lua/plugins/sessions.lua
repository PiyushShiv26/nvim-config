return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    -- Optional: customize session_dir
    -- session_dir = vim.fn.stdpath("data") .. "/sessions/",
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "/" },
    session_lens = {
      load_on_setup = false, -- no longer needed
    },
  },
  keys = {
    {
      "<leader>ls",
      "<cmd>AutoSession search<CR>", -- This opens the session picker!
      mode = "n",
      desc = "Search Sessions (auto-session UI)",
    },
    {
      "<leader>ss",
      "<cmd>AutoSession save<CR>",
      mode = "n",
      desc = "Save Session",
    },
    {
      "<leader>sr",
      "<cmd>AutoSession restore<CR>",
      mode = "n",
      desc = "Restore Session",
    },
    {
      "<leader>sd",
      "<cmd>AutoSession delete<CR>",
      mode = "n",
      desc = "Delete Session",
    },
  },
  config = function(_, opts)
    require("auto-session").setup(opts)
  end,
}

