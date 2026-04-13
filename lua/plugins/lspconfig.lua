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

        vim.lsp.config('*', { on_attach = default_on_attach })

        for server, conf in pairs(servers) do
            local preset_on_attach = vim.lsp.config[server].on_attach
            local own_on_attach = conf['on_attach'] or default_on_attach

            conf['on_attach'] = function(client, buffer)
                preset_on_attach(client, buffer)
                own_on_attach(client, buffer)
            end

            vim.lsp.config(server, conf)
            vim.lsp.enable(server)
        end

        -- Ensure the servers above are installed
        require('mason-lspconfig').setup({
            -- ensure_installed = vim.tbl_keys(servers),
        })
    end,
}
