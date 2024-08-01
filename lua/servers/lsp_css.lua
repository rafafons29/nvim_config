return {
  filetypes = { "css", "scss", "less", "qss" },
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
      workspace = {
        checkThirdParty = false,
      },
    },
    scss = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}
