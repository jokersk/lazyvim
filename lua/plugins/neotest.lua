return {
  { "theutz/neotest-pest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-pest" } },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
          require("neotest").output_panel.open()
        end,
        desc = "Run last test",
      },
    },
  },
}
