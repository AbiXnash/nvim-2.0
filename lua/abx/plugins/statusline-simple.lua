-- Simple statusline test
vim.opt.statusline = "%f test%y"
vim.opt.laststatus = 2

print("Basic statusline test:")
print("Statusline option:", vim.opt.statusline)
print("Laststatus:", vim.opt.laststatus)