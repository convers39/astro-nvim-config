local M = {}

function M.abs_path()
  local abs_path = vim.fn.expand "%:p" -- Get absolute path of current file
  M.to_clipboard(abs_path)
end

function M.rel_path()
  local rel_path = vim.fn.fnamemodify(vim.fn.expand "%", ":.")
  M.to_clipboard(rel_path)
end

function M.file_name()
  local name = vim.fn.expand "%:t"
  M.to_clipboard(name)
end

function M.to_clipboard(str) vim.fn.setreg("+", str) end

return M
