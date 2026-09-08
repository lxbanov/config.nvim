return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        delay = 300,
        spec = {
            { "<leader>f", group = "find" },
            { "<leader>s", group = "split" },
            { "<leader>b", group = "buffer" },
            { "<leader>t", group = "terminal" },
            { "<leader>c", group = "code" },
            { "<leader>r", group = "refactor" },
            { "<leader>x", group = "trouble" },
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
