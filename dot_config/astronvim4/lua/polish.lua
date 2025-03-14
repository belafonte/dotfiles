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
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode

  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  -- vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  -- vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
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
    if vim.bo.filetype ~= "neo-tree" and vim.bo.filetype ~= "alpha" then require("astrocore.buffer").sort "bufnr" end
  end,
})

local function session_exists()
  local cwd = vim.fn.getcwd()
  local session_dir = os.getenv "XDG_DATA_HOME" .. "/astronvim4/dirsession"
  local session_file = session_dir .. "/" .. cwd:gsub("/", "_") .. ".json"

  local file = io.open(session_file, "r")
  if file then
    io.close(file)
    return true
  else
    return false
  end
end

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     if session_exists() then
--       vim.g.alpha_disable = true
--       require("resession").load(vim.fn.getcwd(), { dir = "dirsession" })
--     end
--   end,
-- })
-- Check and load session on startup
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     if session_exists() then
--       vim.g.alpha_disable = true
--       require("resession").load(vim.fn.getcwd(), { dir = "dirsession" })
--     end
--
--     -- local resession = require "resession"
--     -- local current_session = resession.get_current()
--     -- resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
--     -- if current_session then require("resession").load(vim.fn.getcwd(), { dir = "dirsession" }) end
--   end,
-- })

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
