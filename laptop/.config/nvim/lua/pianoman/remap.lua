vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pc", vim.cmd.Alpha)
vim.keymap.set("n", "<leader>ss", function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd('normal! ggVG"+y')
    vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Yank entire file to system clipboard" })
