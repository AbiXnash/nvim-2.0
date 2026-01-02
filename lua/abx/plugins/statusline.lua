return {
    -- Minimal but informative statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'lewis6991/gitsigns.nvim',
        },
        config = function()
            require('lualine').setup({
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    'NvimTree',
                    'Trouble',
                    'qf',
                    'help',
                },
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 100, -- Refresh every 100ms
                    tabline = 100,
                },
                sections = {
                        lualine_a = {
                        {
                            -- Mode indicator
                            function()
                                local mode_map = {
                                    n = 'NORMAL',
                                    i = 'INSERT',
                                    v = 'VISUAL',
                                    c = 'COMMAND',
                                    r = 'REPLACE',
                                    t = 'TERMINAL',
                                }
                                local mode = vim.fn.mode()
                                
                                -- Different colors per mode
                                local colors = {
                                    NORMAL = { fg = '#8ec07c', bg = '#1a1b1d' },
                                    INSERT = { fg = '#ffffff', bg = '#1a1b1d' },
                                    VISUAL = { fg = '#ffa500', bg = '#1a1b1d' },
                                    COMMAND = { fg = '#ff61a8', bg = '#1a1b1d' },
                                    REPLACE = { fg = '#ffaa33', bg = '#1a1b1d' },
                                    TERMINAL = { fg = '#4b5563', bg = '#1a1b1d' },
                                }
                                
                                return mode_map[mode] or mode
                            end,
                            color = colors[mode] or { fg = '#ffffff', bg = '#ff6e6e' },
                        },
                    },
                    lualine_b = {
                        {
                            -- Git branch
                            function()
                                local git_branch = vim.b.gitsigns_head
                                if git_branch then
                                    return '  ' .. git_branch
                                end
                                return ''
                            end,
                            color = { fg = '#8ec07c', gui = 'bold' },
                        },
                        {
                            -- Git changes
                            function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    local added = gitsigns.added or 0
                                    local changed = gitsigns.changed or 0
                                    local removed = gitsigns.removed or 0
                                    if added + changed + removed > 0 then
                                        return string.format(' +%s ~%s -%s', added, changed, removed)
                                    end
                                end
                                return ''
                            end,
                            color = { fg = '#ffaa00' },
                        },
                    },
                    lualine_c = {
                        {
                            -- LSP status
                            function()
                                local lsp_clients = vim.lsp.get_clients({ bufnr = 0 })
                                if #lsp_clients > 0 then
                                    local client_names = {}
                                    for _, client in ipairs(lsp_clients) do
                                        table.insert(client_names, client.name)
                                    end
                                    return '  ' .. table.concat(client_names, ', ')
                                end
                                return ''
                            end,
                            color = { fg = '#00aaff' },
                        },
                        {
                            -- Diagnostics count
                            function()
                                local diagnostics = vim.diagnostic.count(0)
                                if diagnostics.errors > 0 then
                                    return '  ' .. diagnostics.errors
                                elseif diagnostics.warnings > 0 then
                                    return '  ' .. diagnostics.warnings
                                elseif diagnostics.hints > 0 then
                                    return ' 󰛶 ' .. diagnostics.hints
                                elseif diagnostics.info > 0 then
                                    return ' 󰋽 ' .. diagnostics.info
                                end
                                return ''
                            end,
                            color = { fg = '#00ffcc' },
                        },
                    },
                    lualine_x = {
                        {
                            -- Cursor position
                            function()
                                local line = vim.fn.line('.')
                                local col = vim.fn.col('.')
                                local total_lines = vim.fn.line('$')
                                return string.format(' %d:%d', line, col, total_lines)
                            end,
                            color = { fg = '#00ffcc' },
                        },
                    },
                    lualine_z = {
                        {
                            -- File info
                            function()
                                local file = vim.fn.expand('%:t')
                                local readonly = vim.fn.readonly('%') == 1 and ' ' or ''
                                local modified = vim.fn.modified('%') == 1 and ' +' or ''
                                return file .. readonly .. modified
                            end,
                            color = { fg = '#abb2bf', gui = 'bold' },
                        },
                    },
                    lualine_y = {
                        {
                            -- File type
                            function()
                                local ft = vim.bo.filetype
                                return ft ~= '' and ' [' .. ft .. ']' or ''
                            end,
                            color = { fg = '#7c3aed', gui = 'bold' },
                        },
                    },
                },
                inactive_sections = {
                    lualine_a = {
                        {
                            function()
                                return vim.fn.expand('%:t')
                            end,
                            color = { fg = '#6c7086', gui = 'bold' },
                        },
                    },
                },
            })
        end,
    },
}