return {
  defaults = {
    mappings = {
      i = {
        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
    },
    prompt_prefix = " 🔭 ",
    selection_caret = "❯ ",
    path_display = { "truncate" },
    file_ignore_patterns = { "node_modules", ".git" },
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = { mirror = false },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  },
  pickers = { find_files = { hidden = true }, colorscheme = { enable_preview = true } },
  extensions = {
    "vim_bookmarks",
    "project",
  },
}
