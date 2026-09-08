return {
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = { "ruff", "stylua" },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local reg = require("mason-registry")
            for _, name in ipairs(opts.ensure_installed) do
                local ok, pkg = pcall(reg.get_package, name)
                if ok and not pkg:is_installed() then
                    pkg:install()
                end
            end
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ts_ls",
                "terraformls",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason-lspconfig.nvim", "saghen/blink.cmp" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config("*", { capabilities = capabilities })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            -- Pyright does not discover .venv on its own unless the venv is
            -- activated in the shell that started Neovim. Point it at the
            -- project's .venv (or $VIRTUAL_ENV) before it starts.
            vim.lsp.config("pyright", {
                before_init = function(_, config)
                    local root = config.root_dir or vim.fn.getcwd()
                    local candidates = { root .. "/.venv/bin/python", root .. "/venv/bin/python" }
                    if vim.env.VIRTUAL_ENV then
                        table.insert(candidates, 1, vim.env.VIRTUAL_ENV .. "/bin/python")
                    end
                    for _, py in ipairs(candidates) do
                        if py and vim.uv.fs_stat(py) then
                            config.settings = config.settings or {}
                            config.settings.python = config.settings.python or {}
                            config.settings.python.pythonPath = py
                            return
                        end
                    end
                end,
            })

            vim.lsp.config("terraformls", {
                init_options = { ignoreSingleFileWarning = true },
            })

            -- Neovim 0.11+ ships with virtual text off; show it, and use icons
            -- in the sign column instead of E/W/I/H letters.
            vim.diagnostic.config({
                virtual_text = { spacing = 2, prefix = "●", source = "if_many" },
                severity_sort = true,
                update_in_insert = false,
                float = { border = "rounded", source = "if_many" },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                    },
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local function m(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
                    end
                    m("gd", "<cmd>Telescope lsp_definitions<cr>", "Go to definition")
                    m("gr", "<cmd>Telescope lsp_references<cr>", "References")
                    m("gD", vim.lsp.buf.declaration, "Go to declaration")
                    m("gi", vim.lsp.buf.implementation, "Go to implementation")
                    m("gt", vim.lsp.buf.type_definition, "Go to type definition")
                    m("K", vim.lsp.buf.hover, "Hover")
                    m("<leader>rn", vim.lsp.buf.rename, "Rename")
                    m("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    m("<leader>d", vim.diagnostic.open_float, "Line diagnostics")
                    m("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols")
                    m("<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace symbols")
                    m("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
                    m("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
                end,
            })
        end,
    },
}
