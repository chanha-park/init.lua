-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.

return {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },

    hls = {
        filetypes = {
            'haskell',
            'lhaskell',
            'cabal',
        },
        settings = {
            haskell = {
                formattingProvider = 'fourmolu',
            },
        },
    },

    clangd = {},

    pyre = {},
    pyright = {},

    html = {},
    cssls = {},
    tailwindcss = {},
    rust_analyzer = {
        diagnostic = {
            enabled = true,
        },
    },

    tsserver = {
        format = { enable = false },
    },
    eslint = {
        settings = {
            format = { enable = true },
            codeAction = {
                disableRuleComment = { enable = false },
            },
            codeActionsOnSave = {
                mode = 'all',
            },
        },
        -- on_attach = function(client, bufnr)
        --     vim.api.nvim_create_autocmd('BufWritePre', {
        --         buffer = bufnr,
        --         command = 'EslintFixAll',
        --     })
        -- end
    },

    prismals = {},
}
