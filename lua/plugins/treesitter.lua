return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "json",
            "markdown",
            "markdown_inline",
            "python",
            "javascript",
            "typescript",
            "html",
            "css",
            "rust",
            "toml",
            "terraform",
            "hcl",
        }

        require("nvim-treesitter").install(ensure_installed)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = ensure_installed,
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
