local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "http://github.com/folke/lazy.nvim.git"
    local _ = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone!!\n",       "ErrorMsg" },
            { "out",                       "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("abx.configs.options")
require("abx.configs.remaps")
require("abx.configs.autocmd")
require("abx.core.lsp")

require("lazy").setup({
    spec = {
        { import = "abx.plugins" },
    },
    checker = { enabled = false },
    change_detection = { notify = false },
})


vim.diagnostic.config({
    virtual_lines = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = false,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})


-- Global LSP Capabilities Normalizer (fixes healthcheck type errors)
local function normalize_capabilities(caps)
    caps = caps or vim.lsp.protocol.make_client_capabilities()

    -- Handle offsetEncoding (common culprit)
    if caps.offsetEncoding then
        if type(caps.offsetEncoding) == "string" then
            local map = { utf_8 = 1, utf_16 = 2, utf_16be = 3, utf_16le = 4 }
            caps.offsetEncoding = map[caps.offsetEncoding:lower():gsub("-", "_")] or 1
        elseif type(caps.offsetEncoding) == "table" then
            if caps.offsetEncoding.preferred then
                local pref = caps.offsetEncoding.preferred
                local map = { utf_8 = 1, utf_16 = 2, utf_16be = 3, utf_16le = 4 }
                caps.offsetEncoding.preferred = map[pref:lower():gsub("-", "_")] or 1
            end
        end
    else
        caps.offsetEncoding = { preferred = 1 } -- Default to utf-8
    end

    -- Handle positionEncodings (e.g., in svelte config)
    if caps.general and caps.general.positionEncodings then
        local pos_enc = caps.general.positionEncodings
        if type(pos_enc) == "table" then
            for i, enc in ipairs(pos_enc) do
                if type(enc) == "string" then
                    local map = { ["utf-8"] = 1, ["utf-16"] = 2, ["utf-32"] = 3 }
                    pos_enc[i] = map[enc:lower()] or 1
                end
            end
        end
    end

    -- Blink.cmp integration (if available)
    local ok, blink = pcall(require, "blink.cmp")
    if ok then
        caps = vim.tbl_deep_extend("force", caps, blink.get_lsp_capabilities() or {})
    end

    return caps
end

-- Override lspconfig's default capabilities globally
local lspconfig = require("lspconfig")
lspconfig.util.default_config.capabilities = normalize_capabilities()
