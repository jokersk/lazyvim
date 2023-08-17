return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fF",
      "[[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]",
      desc = "Search All files",
    },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        "vendor",
      },
    },
  },
}
