return {
  n = {
    gi = function() require("telescope.builtin").lsp_implementations() end,
    gr = function() require("telescope.builtin").lsp_references() end,
    gd = function() require("telescope.builtin").lsp_definitions() end,
  },
}
