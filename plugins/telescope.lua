local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions
local lga_actions = require "telescope-live-grep-args.actions"

-- NOTE: somehow have to put the setup here, did not work in init.lua
require "user.plugins.neoclip"

return {
  defaults = {
    mappings = {
      i = {
        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
    },
    prompt_prefix = " 🔭 ",
    -- prompt_prefix = "  ",
    selection_caret = "❯ ",
    path_display = { "truncate" },
    file_ignore_patterns = { "node_modules", ".git/" },
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
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-'>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
    frecency = {
      default_workspace = "CWD",
      show_unindexed = false,
    },
    file_browser = {
      hidden = true,
      hijack_netrw = true,
      grouped = true,
      select_buffer = true,
      sorting_strategy = "ascending",
      initial_mode = "normal",
      default_selection_index = 2,
      mappings = {
        ["i"] = {
          ["<C-h>"] = fb_actions.goto_parent_dir,
          ["<C-l>"] = actions.select_default,
          ["<C-H>"] = fb_actions.toggle_hidden,
        },
        ["n"] = {
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = actions.select_default,
          ["H"] = fb_actions.toggle_hidden,
          -- your custom normal mode mappings
        },
      },
    },
  },
}
