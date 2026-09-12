return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "Switch buffer" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep word under cursor" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
        { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find in buffer" },
        { "<leader>fR", "<cmd>Telescope resume<cr>", desc = "Resume last picker" },
        { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                -- "file.ts  src/app/explore": filename first, then the directory
                -- relative to cwd when inside it, otherwise with $HOME as "~".
                path_display = function(_, path)
                    local tail = vim.fs.basename(path)
                    local dir = vim.fs.dirname(path)
                    local cwd = vim.fn.getcwd()
                    if dir == cwd then
                        dir = ""
                    elseif dir:sub(1, #cwd + 1) == cwd .. "/" then
                        dir = dir:sub(#cwd + 2)
                    else
                        local home = vim.uv.os_homedir()
                        if home and dir:sub(1, #home) == home then
                            dir = "~" .. dir:sub(#home + 1)
                        end
                    end
                    if dir == "" then
                        return tail
                    end
                    local display = tail .. "  " .. dir
                    return display, { { { #tail + 2, #display }, "TelescopeResultsComment" } }
                end,
                mappings = {},
            },
        })
        pcall(telescope.load_extension, "fzf")
    end,
}
