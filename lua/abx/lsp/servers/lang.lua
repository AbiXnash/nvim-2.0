return {
    {
        "gopls",
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum", "tmpl" },
        root_markers = { "go.mod", "go.work", ".git" },
        settings = {
            gopls = {
                gofumpt = true,
                codelenses = { gc_details = true, generate = true, test = true, tidy = true },
                hints = { assignVariableTypes = true, compositeLiteralFields = true },
                analyses = { nilness = true, unusedparams = true, unusedwrite = true, staticcheck = true },
                usePlaceholders = true,
                completeUnimported = true,
                semanticTokens = true,
            },
        },
    },
    {
        "basedpyright",
        cmd = { vim.fn.expand("~/.local/share/pipx/venvs/basedpyright/bin/basedpyright-langserver"), "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
        settings = {
            basedpyright = {
                analysis = {
                    autoSearchPaths = true,
                    typeCheckingMode = "standard",
                    inlayHints = { callArgumentNames = "all", callArgumentTypes = true },
                },
            },
        },
    },
    {
        "jdtls",
        cmd = { "jdtls", "--jvm-arg=-Xmx4g", "--jvm-arg=-XX:+UseG1GC" },
        settings = {
            java = {
                format = { settings = { url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse/google-java-format.xml" } },
                completion = { importGradleDependencies = true, guessMethodArguments = true },
                sources = { organizeImports = { starThreshold = 9999 } },
            },
        },
    },
    {
        "kotlin_language_server",
        cmd = { "kotlin-language-server" },
        filetypes = { "kotlin" },
        root_markers = { "build.gradle.kts", "settings.gradle.kts", ".git" },
        settings = { kotlin = { compiler = { jvm = { target = "JVM_17" } } } },
    },
    {
        "rust_analyzer",
        root_markers = { "Cargo.toml", "Cargo.lock" },
        filetypes = { "rust" },
        settings = {
            ["rust-analyzer"] = {
                check = { command = "clippy" },
                cargo = { allFeatures = true, loadOutDirsFromCheck = true },
            },
        },
    },
    {
        "lua_ls",
        filetypes = { "lua" },
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
                hint = { enable = true },
            },
        },
    },
    {
        "pmizio/typescript-tools.nvim",
        ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        opts = {
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                if vim.lsp.inlay_hint then vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end
            end,
            settings = {
                tsserver = {
                    checkJs = true,
                    strictNullChecks = true,
                    inlayHints = { includeInlayParameterNameHints = "all" },
                },
            },
        },
    },
    {
        "svelte",
        cmd = { "svelteserver", "--stdio" },
        filetypes = { "svelte" },
        on_attach = function(client)
            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts", "*.svelte" },
                callback = function(ctx) client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file }) end,
            })
        end,
        settings = { svelte = { plugin = { html = true, css = true, typescript = true } } },
    },
    { "astro", cmd = { "astro-ls", "--stdio" }, filetypes = { "astro" } },
}
