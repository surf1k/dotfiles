return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 900,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Steampunk Emerald Palette
    local colors = {
      bg            = "#0c140e",
      surface       = "#14281a",
      surface_light = "#1d3e26",
      fg            = "#dce7cf",
      fg_dim        = "#7b937e",
      brass         = "#dec07e",
      brass_bright  = "#fed594",
      brass_dark    = "#8e6c32",
      emerald       = "#78c45d",
      emerald_bright= "#96e077",
      copper        = "#d4574a",
      cyan_vapor    = "#6bc5b8",
      blue_steel    = "#5aa8c0",
    }

    local steampunk_emerald_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.emerald, gui = "bold" },
        b = { fg = colors.brass, bg = colors.surface },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.brass, gui = "bold" },
        b = { fg = colors.emerald, bg = colors.surface },
        c = { fg = colors.fg, bg = colors.bg },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.brass_bright, gui = "bold" },
        b = { fg = colors.brass, bg = colors.surface_light },
        c = { fg = colors.fg, bg = colors.bg },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.copper, gui = "bold" },
        b = { fg = colors.copper, bg = colors.surface },
        c = { fg = colors.fg, bg = colors.bg },
      },
      command = {
        a = { fg = colors.bg, bg = colors.cyan_vapor, gui = "bold" },
        b = { fg = colors.cyan_vapor, bg = colors.surface },
        c = { fg = colors.fg, bg = colors.bg },
      },
      inactive = {
        a = { fg = colors.fg_dim, bg = colors.surface },
        b = { fg = colors.fg_dim, bg = colors.surface },
        c = { fg = colors.fg_dim, bg = colors.bg },
      },
    }

    require("lualine").setup({
      options = {
        theme = steampunk_emerald_theme,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = {
          {
            function()
              local mode_map = {
                ["n"]     = "⚙ CLOCKWORK",
                ["no"]    = "⚙ O-PENDING",
                ["nov"]   = "⚙ O-PENDING",
                ["noV"]   = "⚙ O-PENDING",
                ["v"]     = "❖ STEAM",
                ["V"]     = "❖ STEAM-LINE",
                ["\22"]   = "❖ STEAM-BLOCK",
                ["s"]     = "◈ SELECT",
                ["S"]     = "◈ S-LINE",
                ["\19"]   = "◈ S-BLOCK",
                ["i"]     = "✦ FORGE",
                ["ic"]    = "✦ FORGE-COMPL",
                ["R"]     = "🔥 PRESSURE",
                ["Rv"]    = "🔥 V-REPLACE",
                ["c"]     = "⚡ REGULATOR",
                ["cv"]    = "⚡ VIM EX",
                ["ce"]    = "⚡ EX",
                ["r"]     = "⚙ PROMPT",
                ["rm"]    = "⚙ MORE",
                ["r?"]    = "⚙ CONFIRM",
                ["!"]     = "⚙ SHELL",
                ["t"]     = "⚙ TERMINAL",
              }
              return mode_map[vim.fn.mode()] or vim.fn.mode()
            end,
            separator = { right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          { "branch", icon = "", color = { fg = colors.brass, gui = "bold" } },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = {
              added = { fg = colors.emerald_bright },
              modified = { fg = colors.brass },
              removed = { fg = colors.copper },
            },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
        },
        lualine_c = {
          {
            function() return "⚙" end,
            color = { fg = colors.emerald },
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
            file_status = true,
            path = 1, -- relative path
            symbols = {
              modified = " ● [UNSAVED]",
              readonly = "  [LOCKED]",
              unnamed = "❖ UNTITLED",
            },
            color = { fg = colors.fg, gui = "bold" },
          },
        },
        lualine_x = {
          {
            function()
              return "⚙ 3.2 BAR ☁"
            end,
            color = { fg = colors.brass_bright, gui = "bold" },
            separator = { left = "" },
          },
          {
            "encoding",
            fmt = string.upper,
            color = { fg = colors.fg_dim },
          },
          {
            "fileformat",
            symbols = { unix = "LF 󰌽", dos = "CRLF 󰌽", mac = "CR 󰌽" },
            color = { fg = colors.fg_dim },
          },
        },
        lualine_y = {
          {
            "filetype",
            colored = true,
            icon_only = false,
          },
        },
        lualine_z = {
          {
            function()
              local line = vim.fn.line(".")
              local col = vim.fn.col(".")
              local total = vim.fn.line("$")
              local pct = total > 0 and math.floor((line / total) * 100) or 0
              return string.format("❖ %d:%d │ %d%% ◈ ☰ %d", line, col, pct, total)
            end,
            separator = { left = "" },
            color = { fg = colors.bg, bg = colors.brass, gui = "bold" },
          },
        },
      },
      extensions = { "nvim-tree", "quickfix", "toggleterm" },
    })
  end,
}
