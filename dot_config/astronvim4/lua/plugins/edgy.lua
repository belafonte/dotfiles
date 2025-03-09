return {
  "folke/edgy.nvim",
  enabled = true,
  event = "VeryLazy",
  keys = {
    {
      "<leader>ue",
      function() require("edgy").toggle() end,
      desc = "Edgy Toggle",
    },
    -- stylua: ignore
    { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
  },
  opts = function()
    local opts = {
      animate = {
        enabled = false,
      },
      bottom = {
        {
          ft = "toggleterm",
          size = { height = 0.4 },
          filter = function(buf, win) return vim.api.nvim_win_get_config(win).relative == "" end,
        },
        {
          ft = "noice",
          size = { height = 0.4 },
          filter = function(buf, win) return vim.api.nvim_win_get_config(win).relative == "" end,
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf) return vim.bo[buf].buftype == "help" end,
        },
        -- { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
        -- { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
      },
      left = {
        {
          title = "Files",
          ft = "neo-tree",
          filter = function(buf, win)
            return vim.b[buf].neo_tree_source == "filesystem" and vim.api.nvim_win_get_config(win).relative == ""
          end,
          -- Neo-tree filesystem always takes half the screen height
          size = { height = 0.5, width = 40 },
        },
        {
          title = "Git Status",
          ft = "neo-tree",
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative ~= "win" and vim.b[buf].neo_tree_source == "git_status"
          end,
          open = "Neotree position=right git_status",
        },
        {
          title = "Buffers",
          ft = "neo-tree",
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative ~= "win" and vim.b[buf].neo_tree_source == "buffers"
          end,
          open = "Neotree position=top buffers",
        },
      },
      right = {
        { title = "Grug Far", ft = "grug-far", size = { width = 0.4 } },
        { ft = "copilot-chat", title = "Copilot Chat", size = { width = 0.4 } },
      },
      keys = {
        -- increase width
        ["<c-Right>"] = function(win) win:resize("width", 2) end,
        -- decrease width
        ["<c-Left>"] = function(win) win:resize("width", -2) end,
        -- increase height
        ["<c-Up>"] = function(win) win:resize("height", 2) end,
        -- decrease height
        ["<c-Down>"] = function(win) win:resize("height", -2) end,
      },
    }
    return opts
  end,
}
