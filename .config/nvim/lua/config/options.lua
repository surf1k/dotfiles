-- Steampunk Emerald Neovim Configuration: Options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.laststatus = 3

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Scrolling ergonomics
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Visual & Display
opt.termguicolors = true
opt.wrap = false
opt.showmode = false -- handled by lualine
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- System clipboard (Wayland wl-clipboard)
opt.clipboard = "unnamedplus"

-- Undo & Backup files
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Responsiveness
opt.updatetime = 200
opt.timeoutlen = 300

-- Mouse support
opt.mouse = "a"

-- Completion options
opt.completeopt = { "menu", "menuone", "noselect" }
