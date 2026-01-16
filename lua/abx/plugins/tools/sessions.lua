return {
    -- Session persistence
    {
        "folke/persistence.nvim",
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('persistence').setup({
                dir = vim.fn.expand(vim.fn.stdpath('data') .. '/sessions/'), -- Directory for session files
                options = { 'buffers', 'curdir', 'folds', 'tabpages', 'winsize' },
            })

            -- Session keymaps
            vim.keymap.set('n', '<leader>ss', '<cmd>SessionSave<CR>', { 
                desc = 'Save session' 
            })
            vim.keymap.set('n', '<leader>sl', '<cmd>SessionLoad<CR>', { 
                desc = 'Load last session' 
            })
            vim.keymap.set('n', '<leader>sd', '<cmd>SessionDelete<CR>', { 
                desc = 'Delete session' 
            })
            vim.keymap.set('n', '<leader>sp', '<cmd>SessionLoadLast<CR>', { 
                desc = 'Load last session (persistence)' 
            })

            -- Auto-save session on exit
            vim.api.nvim_create_autocmd('VimLeavePre', {
                group = vim.api.nvim_create_augroup('SessionAutoSave', { clear = true }),
                callback = function()
                    -- Only save if we're in a real session
                    if vim.fn.argc() == 0 and vim.fn.filereadable(vim.fn.getcwd()) then
                        require('persistence').save()
                    end
                end,
            })

            -- Restore session on startup if available
            vim.api.nvim_create_autocmd('VimEnter', {
                group = vim.api.nvim_create_augroup('SessionAutoLoad', { clear = true }),
                callback = function()
                    -- Only restore if no file was specified on launch
                    if vim.fn.argc() == 0 then
                        require('persistence').load()
                    end
                end,
                once = true,
            })
        end,
    },
}