return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ts_ls",
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
                    m("<leader>fm", function() vim.lsp.buf.format({ async = true }) end, "Format")
                    m("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols")
                    m("<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace symbols")
                    m("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
                    m("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
                end,
            })
        end,
    },
}
