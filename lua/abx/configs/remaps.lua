-- Disable keymaps
local disable = {
    "<left>",
    "<right>",
    "<up>",
    "<down>",
}

for _, key in ipairs(disable) do
    vim.keymap.set("n", key, '<cmd> echo "Disabled! you **VIM Motions**"<CR>')
end

-- <Esc> to exit search mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Remap <Esc>
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Move lines
vim.keymap.set("v", ",", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", ".", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Stay at the middle when scrolling/searching
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Window switch
vim.keymap.set("n", "<C-h>", "<C-w>h") -- Left
vim.keymap.set("n", "<C-l>", "<C-w>l") -- Right
vim.keymap.set("n", "<C-j>", "<C-w>j") -- Down
vim.keymap.set("n", "<C-k>", "<C-w>k") -- Up

-- System clipboard
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- File Tree
vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>", { desc = "File tree" })
vim.keymap.set("n", "<C-up>", "<cmd>Sexplore<CR>", { desc = "Split explore above" })
vim.keymap.set("n", "<C-down>", "<cmd>Hexplore<CR>", { desc = "Horizontal explore below" })
vim.keymap.set("n", "<C-left>", "<cmd>Vexplore<CR>", { desc = "Vertical explore left" })

-- Git
vim.keymap.set("n", "<leader>g", "<cmd>G<CR>", { desc = "Git status (Fugitive)" })
