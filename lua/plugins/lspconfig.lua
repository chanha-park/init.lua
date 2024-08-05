-- LSP Configuration & Plugins
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        require('plugins.mason'),
        require('plugins.mason-lspconfig'),
    },
    config = function()
        -- [[ Configure LSP ]]
        --  This func gets run when an LSP connects to a particular buffer.
        local default_on_attach = require('plugins.lsp.attach')
        local servers = require('plugins.lsp.servers')
        local lspconfig = require('lspconfig')

        -- ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
        --Enable snippet capability for completion
        local default_client_cap = vim.lsp.protocol.make_client_capabilities()

        default_client_cap.textDocument.completion.completionItem.snippetSupport =
            true

        for server, conf in pairs(servers) do
            conf['on_attach'] = conf['on_attach'] or default_on_attach
            conf['capabilities'] = conf['capabilities'] or default_client_cap

            lspconfig[server].setup(conf)
        end

        -- Ensure the servers above are installed
        require('mason-lspconfig').setup({
            -- ensure_installed = vim.tbl_keys(servers),
        })

        -- require('plugins.lsp.autoformat')
    end,
}
