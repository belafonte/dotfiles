return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      -- open_mapping = [[<c-\>]],
      start_in_insert = true,
      persist_mode = false,
      shade_terminals = false,
      terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
      shell = "/opt/homebrew/bin/fish",
      -- shell = "/bin/bash"
    },
  },
}
