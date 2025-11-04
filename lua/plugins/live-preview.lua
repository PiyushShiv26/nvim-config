return {
  "brianhuster/live-preview.nvim",
  ft = { "html" },
  cmd = { "LivePreview" },

  keys = {
    {
      "<leader>s",
      "<cmd>LivePreview<cr>",
      desc = "Start Live Preview",
    },
  },

  config = function()
  end,
}
