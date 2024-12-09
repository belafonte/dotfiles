return {
  "nvim-telescope/telescope.nvim",
  dependencies = {},
  opts = function(_, opts)
    local actions = require "telescope.actions"
    local get_icon = require("astroui").get_icon
    return require("astrocore").extend_tbl(opts, {
      defaults = {
        git_worktrees = vim.g.git_worktrees,
        prompt_prefix = string.format("%s ", get_icon "Search"),
        selection_caret = string.format("%s ", get_icon "Selected"),
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = { ["q"] = actions.close },
        },
      },
      extensions = {},
      pickers = {
        -- current_buffer_tags = { fname_width = 100 },
        -- jumplist = { fname_width = 100 },
        -- loclist = { fname_width = 100 },
        -- lsp_definitions = { fname_width = 100 },
        -- lsp_document_symbols = { fname_width = 100 },
        -- lsp_dynamic_workspace_symbols = { fname_width = 100 },
        -- lsp_implementations = { fname_width = 100 },
        -- lsp_incoming_calls = { fname_width = 100 },
        -- lsp_outgoing_calls = { fname_width = 100 },
        lsp_references = { show_line = false },
        -- lsp_type_definitions = { fname_width = 100 },
        -- lsp_workspace_symbols = { fname_width = 100 },
        -- quickfix = { fname_width = 100 },
        -- tags = { fname_width = 100 },
      },
    })
  end,
}
