local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git find files" })
vim.keymap.set("n", "<leader>pr", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>ps", function()
    builtin.live_grep({
        additional_args = {
            "--hidden",
            "--glob",
            "!node_modules/**",
        },
    })
end, { desc = "Live grep (including hidden files)" })
