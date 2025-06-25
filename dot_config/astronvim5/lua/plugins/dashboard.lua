return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon

    opts.dashboard = {
      preset = {
        header = table.concat({
          "█████████████████████████████████████████████",
          "   ███████████████████████████████████████   ",
          "     █████████                 █████████     ",
          "     ████████                   ████████     ",
          "     ████████                   ████████     ",
          "     ████████                   ████████     ",
          "     ████████                   ████████     ",
          "     ████████                   ████████     ",
          "     ████████                   ████████     ",
          "     ████████                   ████████     ",
          "     ████████                   ████████     ",
          "     ████████                   ████████     ",
          "  ██████████████             ██████████████  ",
          "██████████████████         ██████████████████",
        }, "\n"),
        keys = {
          { key = "n", action = "<Leader>n", icon = get_icon("FileNew", 0, true), desc = "New File  " },
          { key = "s", action = "<Leader>SF", icon = get_icon("Refresh", 0, true), desc = "Load Session" },
          { key = "f", action = "<Leader>ff", icon = get_icon("Search", 0, true), desc = "Find File  " },
          { key = "o", action = "<Leader>fo", icon = get_icon("DefaultFile", 0, true), desc = "Recents  " },
          { key = "w", action = "<Leader>fw", icon = get_icon("WordFile", 0, true), desc = "Find Word  " },
          { key = "'", action = "<Leader>f'", icon = get_icon("Bookmarks", 0, true), desc = "Bookmarks  " },
        },
      },
    }
  end,
}
