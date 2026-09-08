return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        current_line_blame = false,
        on_attach = function(buf)
            local gs = require("gitsigns")
            local function m(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
            end
            m("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
            m("n", "[h", function() gs.nav_hunk("prev") end, "Prev hunk")
            m({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
            m({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
            m("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
            m("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
            m("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
            m("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk")
            m("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
            m("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
            m("n", "<leader>gd", gs.diffthis, "Diff against index")
            m("n", "<leader>gD", function() gs.diffthis("~") end, "Diff against last commit")
            m({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
        end,
    },
}
