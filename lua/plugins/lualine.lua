return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { statusline = { "lazy", "mason" } },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                "branch",
                { "diff", symbols = { added = " ", modified = " ", removed = " " } },
            },
            lualine_c = {
                { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" } },
                { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
            },
            lualine_x = {
                {
                    function()
                        local clients = vim.lsp.get_clients({ bufnr = 0 })
                        if #clients == 0 then return "" end
                        local names = {}
                        for _, c in ipairs(clients) do names[#names + 1] = c.name end
                        return " " .. table.concat(names, ", ")
                    end,
                },
                "encoding",
                "filetype",
            },
            lualine_y = { "progress", "location" },
            lualine_z = {
                function() return os.date(" %H:%M") end,
            },
        },
        extensions = { "lazy", "mason", "trouble", "quickfix" },
    },
}
