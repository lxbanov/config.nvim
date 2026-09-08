return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = function()
        local keys = {
            { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon add file" },
            { "<leader>h", function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, desc = "Harpoon menu" },
            { "<C-p>", function() require("harpoon"):list():prev() end, desc = "Harpoon prev" },
            { "<C-n>", function() require("harpoon"):list():next() end, desc = "Harpoon next" },
        }
        for i = 1, 5 do
            table.insert(keys, {
                "<leader>" .. i,
                function() require("harpoon"):list():select(i) end,
                desc = "Harpoon file " .. i,
            })
        end
        return keys
    end,
}
