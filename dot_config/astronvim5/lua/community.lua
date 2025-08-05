-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.recipes.vscode-icons" },
  { import = "astrocommunity.recipes.neovide" },
  -- { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  -- ----------------------------------------------
  -- Diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- ----------------------------------------------
  -- Bars and Lines
  { import = "astrocommunity.bars-and-lines.scope-nvim" },
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        themable = true,
        -- style_preset = "minimal",
        always_show_bufferline = false,
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon",
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            -- padding = 1,
            separator = true,
          },
        },
      },
    },
  },

  -- ----------------------------------------------
  -- Code Runnners
  { import = "astrocommunity.code-runner.conjure" },
  {
    "Olical/conjure",
    ft = { "clojure", "janet", "fennel", "racket", "hy", "scheme", "guile", "julia", "lua", "lisp", "python" },
  },

  -- ----------------------------------------------
  -- colorchemes
  { import = "astrocommunity.colorscheme.everforest" },

  -- ----------------------------------------------
  -- Motion plugins
  -- :help nvim-surround.usage.
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.marks-nvim" },

  -- ----------------------------------------------
  -- Editor support
  -- Rainbow parens
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  -- { import = "astrocommunity.editing-support.multicursors-nvim" },

  {
    "folke/todo-comments.nvim",
    opts = {
      sign_priority = 5, -- higher sign display priority
    },
  },

  -- { import = "astrocommunity.editing-support.zen-mode-nvim" },
  -- {
  --   "folke/zen-mode.nvim",
  --   opts = {
  --     -- override default configuration
  --     -- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
  --     plugins = {
  --       options = {
  --         enabled = true,
  --       },
  --       kitty = {
  --         enabled = true,
  --         font = "+4", -- font size increment
  --       },
  --     },
  --   },
  -- },

  -- ----------------------------------------------
  -- File Explorer
  -- { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },

  -- ----------------------------------------------
  -- Media
  -- { import = "astrocommunity.media.image-nvim" },

  -- ----------------------------------------------
  -- Git Integrations
  -- { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.diffview-nvim" },

  -- ----------------------------------------------
  -- Terminal Integration

  -- ----------------------------------------------
  -- Motion
  -- Navigate with search labels
  { import = "astrocommunity.motion.flash-nvim" }, -- overrides S surround in visual state

  -- ----------------------------------------------
  -- Packs
  -- Treesitter: clojure , Lsp: clojure-lsp, Lint/format:
  { import = "astrocommunity.pack.clojure" },
  { "gpanders/nvim-parinfer", enabled = false },
  { "dundalek/parpar.nvim", enabled = false },
  -- Treesitter: dockerfile , Lsp: dockerls & docker_compose_language_service, Lint/format: hadolint
  { import = "astrocommunity.pack.docker" },
  -- Treesitter: json & jsonc, Lsp: jsonls, Lint/format: stylua
  { import = "astrocommunity.pack.json" },
  -- Treesitter: lua, Lsp: lua_ls, Lint/format: stylua
  { import = "astrocommunity.pack.lua" },

  -- This plugin does the following
  -- Adds 'ruby' treesitter parser
  -- Adds 'solargraph' language server
  -- Adds 'standardrb' through null-ls
  -- Adds 'nvim-dap-ruby'
  -- DOES NOT WORK -> LSP TIMEOUT
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.python" },

  -- Pack not used as prettierd too agressive with format
  -- Treesitter: markdown & markdown_inline, Lsp: marksman, Lint/format: prettierd
  -- { import = "astrocommunity.pack.markdown" },
  -- Treesitter: markdown & markdown_inline, Lsp: marksman, Lint/format: prettierd
  -- { import = "astrocommunity.pack.yaml" },

  -- ----------------------------------------------
  { import = "astrocommunity.search.grug-far-nvim" }, -- search and replace

  -- ----------------------------------------------
  -- Project
  -- { import = "astrocommunity.project.project-nvim" }, -- switch between projects

  -- ----------------------------------------------
  -- Programing Language support
  -- { import = "astrocommunity.programming-language-support.nvim-jqx" },
  -- { import = "astrocommunity.programming-language-support.rest-nvim" },

  -- ----------------------------------------------
  -- registers
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  -- ----------------------------------------------
  --

  -- ----------------------------------------------
  -- scrolling
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- {
  --   "karb94/neoscroll.nvim",
  --   opts = {
  --     mappings = { "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  --   },
  -- },

  -- { import = "astrocommunity.scrolling.mini-animate" },
  -- { import = "astrocommunity.scrolling.cinnamon-nvim" },

  -- ----------------------------------------------
  -- Split and Window
  -- { import = "astrocommunity.split-and-window.edgy-nvim" },
  -- {
  --   "folke/edgy.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     opts.right = opts.right or {}
  --     table.insert(opts.right, {
  --       ft = "copilot-chat",
  --       title = "Copilot Chat",
  --       size = { width = 50 },
  --     })
  --   end,
  -- },
  -- { import = "astrocommunity.split-and-window.windows-nvim" },

  -- Code Completion
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- Indent
  -- ----------------------------------------------
  { import = "astrocommunity.indent.mini-indentscope" },

  -- ----------------------------------------------
  -- Themes
  -- defined in themes.lua
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Markdown and Latex
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

  -- ----------------------------------------------
  -- Utility
  -- rich command prompt
  { import = "astrocommunity.utility.noice-nvim" },

  -- Version Control
  -- defined in plugins/git.lua

  -- { "max397574/better-escape.nvim", enabled = false },
  -- ----------------------------------------------
}
