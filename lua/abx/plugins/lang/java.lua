return {
    -- Java debugging with nvim-dap
    {
        "mfussenegger/nvim-dap",
        ft = "java",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")

            -- Configure Java debugger
            dap.configurations.java = {
                {
                    type = "java",
                    request = "launch",
                    name = "Launch Current File",
                    mainClass = "${fileBasenameNoExtension}",
                    args = {},
                },
                {
                    type = "java",
                    request = "attach",
                    name = "Attach to JVM",
                    hostName = "localhost",
                    port = 5005,
                },
            }

            -- Debug keymaps
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue debugging" })
            vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
            vim.keymap.set("n", "<leader>dk", dap.terminate, { desc = "Terminate debug" })
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Conditional breakpoint" })
            vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step over" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
            vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
            vim.keymap.set("n", "<leader>de", function()
                vim.ui.input({ prompt = "Expression to evaluate: " }, function(input)
                    if input then
                        dap.eval(input)
                    end
                end)
            end, { desc = "Evaluate expression" })
        end,
    },

    -- Java test runner
    {
        "nvim-neotest/neotest",
        ft = "java",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("neotest").setup({
                adapters = {},
            })

            -- Test keymaps
            vim.keymap.set("n", "<leader>jt", "<cmd>Neotest run<CR>", { desc = "Run nearest test" })
            vim.keymap.set("n", "<leader>jT", "<cmd>Neotest run file<CR>", { desc = "Run all tests in file" })
            vim.keymap.set("n", "<leader>js", "<cmd>Neotest summary<CR>", { desc = "Test summary" })
            vim.keymap.set("n", "<leader>jo", "<cmd>Neotest output<CR>", { desc = "Test output panel" })
            vim.keymap.set("n", "<leader>jf", "<cmd>Neotest run functions<CR>", { desc = "Run test function" })
        end,
    },
}
