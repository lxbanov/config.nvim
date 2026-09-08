local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"

-- Only affects GUI frontends (Neovide, GoNeoVim, etc.); for terminal Neovim,
-- set the font in your terminal emulator's settings instead.
vim.o.guifont = "Commit Mono:h14"

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 300
