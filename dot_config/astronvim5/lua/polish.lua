-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-v>", '<C-\\><C-n>"+pa', { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", '<C-\\><C-n>"+pa', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function() vim.opt.relativenumber = false end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function() vim.opt.relativenumber = true end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
  callback = function()
    if vim.bo.filetype ~= "neo-tree" and vim.bo.filetype ~= "snacks" then
      require("astrocore.buffer").sort(tostring(vim.fn.bufnr()))
    end
  end,
})

-- Save session on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function() require("resession").save(vim.fn.getcwd(), { dir = "dirsession", notify = false }) end,
})

local function set_scroll_off()
  -- local height = vim.api.nvim_win_get_height(0)
  vim.o.scrolloff = 9999
end

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "WinNew", "VimResized" }, {
  callback = function() set_scroll_off() end,
})
