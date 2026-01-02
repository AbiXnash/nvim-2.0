-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Python formatting on save using conform
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("ConformAutoFormat", { clear = true }),
    pattern = "*.py",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})