return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = false,
        overrides = function(palette)
            return {
                Normal = { bg = "#050505" },
                NormalNC = { bg = "#050505" },
                NormalFloat = { bg = "#111111" },
                SignColumn = { bg = "#111111" },
                LineNr = { bg = "#111111" },
                CursorLineNr = { bg = "#111111" },
                CursorLine = { bg = "#111111" },
                EndOfBuffer = { bg = "#050505" },
                FloatBorder = { bg = "#111111" },
                Pmenu = { bg = "#111111" },
                PmenuSel = { bg = palette.sumiInk4 },
            }
        end,
    },
    config = function(_, opts)
        require("kanagawa").setup(opts)
        vim.cmd.colorscheme("kanagawa")
    end,
}
