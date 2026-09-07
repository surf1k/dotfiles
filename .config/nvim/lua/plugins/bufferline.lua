return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "⚙ WORKSHOP",
            text_align = "center",
            separator = true,
          },
        },
      },
      highlights = {
        fill = {
          bg = "#0c140e",
        },
        background = {
          fg = "#7b937e",
          bg = "#14281a",
        },
        buffer_selected = {
          fg = "#dec07e",
          bg = "#1d3e26",
          bold = true,
          italic = false,
        },
        separator_selected = {
          fg = "#0c140e",
          bg = "#1d3e26",
        },
        separator = {
          fg = "#0c140e",
          bg = "#14281a",
        },
        indicator_selected = {
          fg = "#78c45d",
          bg = "#1d3e26",
        },
      },
    })
  end,
}
