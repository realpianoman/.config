vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 4 -- indentation size
vim.opt.tabstop = 4 -- a tab character displays as 4 spaces
vim.opt.softtabstop = 4 -- insert 4 spaces when pressing Tab
vim.opt.number = true
vim.opt.relativenumber = true
vim.diagnostic.config({
    underline = false,
    virtual_text = true, -- set to false if you also want to hide inline error text
})
