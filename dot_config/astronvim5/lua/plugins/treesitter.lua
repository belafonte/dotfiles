---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "clojure",
      "rust",
      "bash",
      "c",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
      "fennel",
      "git_config",
      "gitignore",
      "graphql",
      "http",
      "jq",
      "make",
      "python",
      "r",
      "sql",
      "yaml", -- yaml pack includes agressive prettierd
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
