return {
    "mikavilpas/yazi.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>-",
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
        },
        {
            "<leader>cw",
            "<cmd>Yazi cwd<cr>",
            desc = "Open yazi in nvim's working directory",
        },
        {
            "<c-up>",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
    },
    opts = {
        open_for_directories = false,
    },
}
