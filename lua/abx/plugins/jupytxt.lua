return {
    {
        "kiyoon/jupynium.nvim",
        build = "pip install --user jupynium",
        ft = { "python", "ipynb" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "jmbuhr/otter.nvim",
        },
        config = function()
            require("jupynium").setup({
                server = {
                    auto_start = true, -- correct key
                    host = "localhost",
                    port = 8888,
                },
                python_host = "python3",
            })
        end
    },
    {
        "benlubas/molten-nvim",
        requires = {
            'nvim-treesitter/nvim-treesitter',
            'jose-morais/molten-image.nvim' -- For image display
        }
    }

}
