-- ====================================================================
--   STEAMPUNK EMERALD NEOVIM CONFIGURATION
--   Aesthetic: Clockwork Forest & Brass Gears
-- ====================================================================

-- 1. Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Load Core Settings
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- 3. Initialize Plugins
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  ui = {
    border = "rounded",
    title = " ⚙ STEAMPUNK EMERALD WORKSHOP ⚙ ",
    title_pos = "center",
    icons = {
      cmd = "⚡",
      config = "⚙",
      event = "📅",
      ft = "󰈚",
      init = "⚙",
      keys = "🗝",
      plugin = "❖",
      runtime = "󰌽",
      require = "󰢱",
      source = "✦",
      start = "▶",
      task = "✔",
      lazy = "💤 ",
    },
  },
  checker = {
    enabled = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
