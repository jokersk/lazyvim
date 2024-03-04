local nio = require("nio")
local lib = require("neotest.lib")
local neotest = require("neotest")
local nio = require("nio")
local buf = nio.api.nvim_create_buf(false, true)
return {
  { "theutz/neotest-pest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-pest" }, max_width = 500 },
    keys = {
      {
        "<leader>to",
        function()
          require("neotest").output.open({
            last_run = true,
            enter = true,
            auto_close = true,
          })
        end,
        desc = "Show Output",
      },
      {
        "<leader>tl",
        function()
          nio.run(function()
            neotest.run.run_last()
          end, function()
            neotest.output.open({ last_run = true, enter = true, auto_close = true })
          end)
        end,
        desc = "Run last test",
      },
    },
  },
}
