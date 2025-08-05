return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 1000,
    top_down = false,
    -- max_height = function() return math.floor(vim.o.lines * 0.75) end,
    -- max_width = function() return math.floor(vim.o.columns * 0.75) end,
    max_height = function() return 10 end,
    max_width = function() return 40 end,
  },
}
