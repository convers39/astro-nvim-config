local M = {}
function M.setup()
  return {
    ensure_installed = {
      -- Lsp
      -- "clangd",
      "pyright",
      "lua-language-server",
      "typescript-language-server",
      "rust-analyzer",
      "vim-language-server",
      "html-lsp",
      "css-lsp",
      "json-lsp",
      "emmet-ls",

      -- Formatter
      -- "prettierd",
      "prettier",
      "stylua",
      "black",
      "yamlfmt",
      "marksman",

      -- Linter
      "mypy",
      "hadolint",
      "eslint_d",
      "eslint-lsp",

      -- Diagnostics
      -- "cspell",

      -- Dap
      -- "debugpy",
    },
  }
end

return M
