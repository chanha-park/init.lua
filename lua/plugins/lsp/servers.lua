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

    clangd = {
        cmd = {
            'clangd',
            '--clang-tidy',
            '--completion-style=detailed',
            '--function-arg-placeholders',
            '--header-insertion=never',
            '--enable-config',
            '--pch-storage=disk',
        },
    },

    neocmake = {},

    -- pyre = {},
    pyright = {},

    rust_analyzer = {
        diagnostic = {
            enabled = true,
        },
    },

    tblgen_lsp_server = {
        cmd = {
            'tblgen-lsp-server',
            '--tablegen-compilation-database=tablegen_compile_commands.yml',
        },
    },

    mlir_lsp_server = {},
}
