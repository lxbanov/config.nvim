local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- smartindent is a C heuristic; treesitter provides indentexpr per language
opt.smartindent = false

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

-- Reload buffers changed on disk by other tools (Claude Code, git checkout,
-- formatters). autoread alone only checks on a few events; force it more often.
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "TermClose", "TermLeave" }, {
    callback = function()
        if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
            vim.cmd.checktime()
        end
    end,
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    callback = function()
        vim.notify("File changed on disk, buffer reloaded", vim.log.levels.INFO)
    end,
})
