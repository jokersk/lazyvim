return {
  "L3MON4D3/LuaSnip",
  build = (not jit.os:find("Windows"))
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("php", { "phpdoc" })
      require("luasnip").filetype_extend("php", { "html" })
      require("luasnip").filetype_extend("blade", { "html" })
    end,
  },
  opts = function(_, opts)
    opts.history = true
    opts.delete_check_events = "TextChanged"
    local ls = require("luasnip")
    local s = ls.snippet
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt
    ls.add_snippets("php", {
      s(
        "it",
        fmt( -- The snippet code actually looks like the equation environment it produces.
          [[
            it('<>', function() {
              <>
            });
          ]],
          -- The insert node is placed in the <> angle brackets
          { i(1), i(2) },
          -- This is where I specify that angle brackets are used as node positions.
          { delimiters = "<>" }
        )
      ),
    })
  end,
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}
