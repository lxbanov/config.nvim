return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fm",
            function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
            mode = { "n", "v" },
            desc = "Format buffer or selection",
        },
    },
    opts = {
        formatters_by_ft = {
            python = { "ruff_organize_imports", "ruff_format" },
            lua = { "stylua" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            markdown = { "prettierd", "prettier", stop_after_first = true },
            terraform = { "terraform_fmt" },
            sh = { "shfmt" },
        },
        -- Opt-in per session with :FormatOnSave; default off so work repos
        -- with unformatted code don't get whole-file diffs.
        format_on_save = function(bufnr)
            if vim.g.format_on_save or vim.b[bufnr].format_on_save then
                return { timeout_ms = 1000, lsp_format = "fallback" }
            end
        end,
    },
    config = function(_, opts)
        require("conform").setup(opts)
        vim.api.nvim_create_user_command("FormatOnSave", function(args)
            vim.g.format_on_save = args.bang and false or not vim.g.format_on_save
            vim.notify("Format on save: " .. (vim.g.format_on_save and "on" or "off"))
        end, { bang = true, desc = "Toggle format on save (! to force off)" })
    end,
}
