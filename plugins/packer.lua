return {
  max_jobs = 10,
  display = {
    open_fn = function() return require("packer.util").float { border = "rounded" } end,
  },
  profile = {
    enable = true,
    threshold = 0.0001,
  },
  git = {
    clone_timeout = 300,
    subcommands = {
      update = "pull --ff-only --progress --rebase=true",
    },
  },
  auto_clean = true,
  compile_on_sync = true,
  compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
}
