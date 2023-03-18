local M = {}

function M.abs_path()
  local path = vim.fn.expand "%:p" -- Get absolute path of current file
  vim.fn.setreg("+", path) -- Set system clipboard register with path
end

function M.rel_path()
  local rel_path = vim.fn.fnamemodify(vim.fn.expand "%", ":.")
  vim.fn.setreg("+", rel_path)
end

function M.file_name()
  local name = vim.fn.expand "%:t"
  vim.fn.setreg("+", name)
end

return M
