return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            separator_style = "thin",
            show_buffer_close_icons = false,
            show_close_icon = false,
            always_show_bufferline = false,
            close_command = function(n) require("mini.bufremove").delete(n, false) end,
            right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        },
    },
    keys = {
        { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
        { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close non-pinned buffers" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
        { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
        { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
        { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
    },
}
