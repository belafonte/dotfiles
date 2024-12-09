return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.opt.background = "dark"
      vim.fn.system 'kitten themes "Everforest Dark Medium"'
    end,
    set_light_mode = function()
      vim.opt.background = "light"
      vim.fn.system 'kitten themes "Everforest Light Medium"'
    end,
  },

  config = function(_, opts) require("auto-dark-mode").setup(opts) end,
  init = function(_) require("auto-dark-mode").init() end,
}
