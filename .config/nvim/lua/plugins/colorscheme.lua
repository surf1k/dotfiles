return {
  -- Primary: Everforest (Deep emerald & forest green)
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.g.everforest_dim_inactive_windows = 0
      vim.g.everforest_diagnostic_text_highlight = 1
      vim.g.everforest_diagnostic_virtual_text = "colored"

      vim.cmd("colorscheme everforest")

      -- Rice color overrides (Emerald & Brass Steampunk accents)
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "FloatBorder", { fg = "#dec07e", bg = "NONE" })
      set_hl(0, "NormalFloat", { bg = "#14281a" })
      set_hl(0, "LineNr", { fg = "#5c6a5a" })
      set_hl(0, "CursorLineNr", { fg = "#dec07e", bold = true })
      set_hl(0, "CursorLine", { bg = "#14281a" })
      set_hl(0, "Search", { fg = "#0c140e", bg = "#dec07e", bold = true })
      set_hl(0, "IncSearch", { fg = "#0c140e", bg = "#78c45d", bold = true })
      set_hl(0, "Visual", { bg = "#1d3e26" })
      set_hl(0, "VertSplit", { fg = "#dec07e" })
      set_hl(0, "WinSeparator", { fg = "#8e6c32" })
    end,
  },

  -- Fallback: Gruvbox (Steampunk brass & copper)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },

  -- Fallback: Tokyo Night
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
}
