local status_ok, fine_cmdline = pcall(require, "fine-cmdline")
if not status_ok or not astronvim.status then return end

fine_cmdline.setup {
  cmdline = {
    enable_keymaps = false,
    smart_history = true,
    prompt = " ",
  },
  popup = {
    position = {
      row = "50%",
      col = "50%",
    },
    size = {
      width = "50%",
    },
    border = {
      style = "rounded",
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  },
  hooks = {
    set_keymaps = function(imap, feedkeys)
      local fn = require("fine-cmdline").fn
      imap("<C-p>", fn.up_search_history)
      imap("<C-n>", fn.down_search_history)
      imap("<Esc>", fn.close)
      imap("<C-c>", fn.close)
    end,
  },
}
