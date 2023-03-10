-- local actions = require "telescope.actions"
local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok or not astronvim.status then return end

neoclip.setup {
  history = 1000,
  enable_persistent_history = false,
  length_limit = 1048576,
  continuous_sync = false,
  db_path = vim.fn.stdpath "data" .. "/databases/neoclip.sqlite3",
  filter = nil,
  preview = true,
  prompt = nil,
  default_register = '"',
  default_register_macros = "q",
  enable_macro_history = true,
  content_spec_column = false,
  on_select = {
    move_to_front = false,
    close_telescope = true,
  },
  on_paste = {
    set_reg = false,
    move_to_front = false,
    close_telescope = true,
  },
  on_replay = {
    set_reg = false,
    move_to_front = false,
    close_telescope = true,
  },
  on_custom_action = {
    close_telescope = true,
  },
  keys = {
    telescope = {
      i = {
        select = "<nop>",
        paste = "<c-p>",
        paste_behind = "<cr>",
        replay = "<c-q>", -- replay a macro
        delete = "<c-d>", -- delete an entry
        edit = "<c-e>", -- edit an entry
        custom = {},
      },
      n = {
        select = "<cr>",
        paste = "p",
        --- It is possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        paste_behind = "P",
        replay = "q",
        delete = "dd",
        edit = "e",
        custom = {},
      },
    },
  },
}
