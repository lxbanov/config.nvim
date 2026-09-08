return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
        { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP defs / refs" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
        { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
        { "gR", "<cmd>Trouble lsp_references toggle<cr>", desc = "References (Trouble)" },
        {
            "[q",
            function()
                if require("trouble").is_open() then
                    require("trouble").prev({ skip_groups = true, jump = true })
                else
                    pcall(vim.cmd.cprev)
                end
            end,
            desc = "Prev trouble/quickfix item",
        },
        {
            "]q",
            function()
                if require("trouble").is_open() then
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    pcall(vim.cmd.cnext)
                end
            end,
            desc = "Next trouble/quickfix item",
        },
    },
}
