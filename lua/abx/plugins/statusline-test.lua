-- Test statusline loading
vim.api.nvim_create_user_command("TestStatusline", function()
    local ok, statusline = pcall(require, "abx.plugins.statusline")
    if ok then
        vim.notify("Statusline loaded successfully", vim.log.levels.INFO)
        print("Statusline OK")
    else
        vim.notify("Statusline load failed: " .. tostring(statusline), vim.log.levels.ERROR)
        print("Statusline ERROR: " .. tostring(statusline))
    end
end, { desc = "Test statusline loading" })