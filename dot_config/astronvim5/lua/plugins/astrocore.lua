-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
--
local function is_current_buffer_visible()
  local current_buf = vim.api.nvim_get_current_buf()
  local winnr = vim.fn.bufwinnr(current_buf)
  return winnr ~= -1
end

local function close_all_nonvisible_buffers()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if vim.fn.bufwinnr(buf) == -1 then require("astrocore.buffer").close(buf, false) end
  end
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = true,
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    sessions = {
      -- Configure auto saving
      autosave = {
        last = true, -- auto save last session
        cwd = true, -- auto save session for each working directory
      },
      -- Patterns to ignore when saving sessions
      ignore = {
        dirs = {}, -- working directories to ignore sessions in
        filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
        buftypes = {}, -- buffer types to ignore sessions
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        neovide_input_macos_option_key_is_meta = "only_left",
        neovide_floating_shadow = false,
        neovide_floating_z_height = 10,
        neovide_light_angle_degrees = 45,
        neovide_light_radius = 5,
      },
    },
    autocmds = {

      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end,
        },
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      v = {
        ["<C-\\>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" }, -- requires terminal that supports binding <C-'>
      },
      n = {
        -- second key is the lefthand side of the map
        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },

        -- MANAGE PACKAGE DEPS
        ["<Leader>pd"] = { desc = "NPM Packages" },
        ["<Leader>pdl"] = { "<cmd>lua require('package-info').show()<cr>", desc = "Show Latest Version" },
        ["<Leader>pdd"] = { "<cmd>lua require('package-info').delete()<cr>", desc = "Delete Package" },
        ["<Leader>pdu"] = { "<cmd>lua require('package-info').change_version()<cr>", desc = "Change Package Version" },
        ["<Leader>pdi"] = { "<cmd>lua require('package-info').install()<cr>", desc = "Install new Package" },

        ["<M-Up>"] = { "<cmd>resize +2<cr>", desc = "Increase window height" },
        ["<M-Down>"] = { "<cmd>resize -2<cr>", desc = "Decrease window height" },
        ["<M-Left>"] = { "<cmd>vertical resize +2<cr>", desc = "Decrease window width" },
        ["<M-Right>"] = { "<cmd>vertical resize -2<cr>", desc = "Increase window width" },
        ["<C-\\>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" }, -- requires terminal that supports binding <C-'>

        -- ["<leader>bv"] = {
        --   "<cmd>silent! windo if winnr('$') > 1 | execute 'bdelete ' . join(filter(range(1, bufnr('$')), 'bufwinnr(v:val) < 0')) | endif<CR>",
        --
        --   desc = "Close Buffers beside open ones",
        -- },
        --
        ["<Leader>bv"] = {
          function() close_all_nonvisible_buffers() end,
          desc = "Close Buffers beside open ones",
        },

        -- Save All
        ["<Leader>W"] = { "<cmd>wa<cr>", desc = "Save All" },
        -- better buffer navigation
        -- ["]b"] = false,
        -- ["[b"] = false,
        --
        -- ["<S-l>"] = {
        --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- ["<S-h>"] = {
        --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- buffer switching
        ["<Tab>"] = {
          function()
            if #vim.t.bufs > 1 then
              require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
            end
          end,
          desc = "Switch Buffers",
        },

        ["<leader>ftl"] = { "<cmd>Neotree filesystem reveal toggle left<CR>", desc = "File explorer Left" },
        ["<leader>ftf"] = { "<cmd>Neotree filesystem reveal toggle float<CR>", desc = "File explorer Float" },

        ["<Leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },
      },
      t = {
        ["<C-\\>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" }, -- requires terminal that supports binding <C-'>
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
