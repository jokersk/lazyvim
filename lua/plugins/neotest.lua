local nio = require("nio")
local lib = require("neotest.lib")
local neotest = require("neotest")
return {
  { "theutz/neotest-pest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-pest" } },
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
