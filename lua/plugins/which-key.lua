return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        delay = 300,
        -- <C-d>/<C-u> are remapped to "<C-d>zz" in keymaps.lua, and which-key
        -- executes real mappings before checking its own scroll keys, so use
        -- keys that are not mapped anywhere.
        keys = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
        spec = {
            { "<leader>f", group = "find" },
            { "<leader>s", group = "split" },
            { "<leader>b", group = "buffer" },
            { "<leader>t", group = "terminal" },
            { "<leader>c", group = "code" },
            { "<leader>r", group = "refactor" },
            { "<leader>x", group = "trouble" },
            { "<leader>g", group = "git" },
            { "g", group = "goto" },
            { "[", group = "prev" },
            { "]", group = "next" },
        },
    },
    keys = {
        { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer keymaps" },
        { "<leader>K", function() require("which-key").show() end, desc = "All keymaps" },
    },
}
