return {
  languages = {
    typescript = {
      template = {
        annotation_convention = "tsdoc",
        tsdoc = {
          { nil, "/**" },
          { nil, " * $1" },
          { "parameters", " * @param %s $1" },
          { "return_statement", " * @return %s $1" },
          { nil, " */" },
        },
      },
    },
    javascript = {
      template = {
        annotation_convention = "jsdoc",
        jsdoc = {
          { nil, "/**" },
          { nil, " * $1" },
          { "parameters", " * @param {any} %s $1" },
          { "return_statement", " * @return {any} %s $1" },
          { nil, " */" },
        },
      },
    },
    typescriptreact = require "neogen.configurations.typescript",
    javascriptreact = require "neogen.configurations.javascript",
  },
}
