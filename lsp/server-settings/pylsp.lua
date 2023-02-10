return {
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        flake8 = {
          enabled = true,
        },
        -- NOTE: flake8 included pycodestyle and pyflakes
        pycodestyle = {
          enabled = false,
        },
        pyflakes = {
          enabled = false,
        },
      },
    },
  },
}
