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
        local on_attach = require('plugins.lsp.attach')
        local servers = require('plugins.lsp.servers')

        -- ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
        --Enable (broadcasting) snippet capability for completion
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport =
            true

        for server, conf in pairs(servers) do
            if conf['on_attach'] == nil then
                conf['on_attach'] = on_attach
            end
            if conf['capabilities'] == nil then
                conf['capabilities'] = capabilities
            end
            require('lspconfig')[server].setup(conf)
        end

        -- Ensure the servers above are installed
        require('mason-lspconfig').setup({
            -- ensure_installed = vim.tbl_keys(servers),
        })

        -- require('plugins.lsp.autoformat')
    end,
}
