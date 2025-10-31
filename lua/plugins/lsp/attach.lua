local methods = vim.lsp.protocol.Methods

return function(client, bufnr)
    -- In this case, we create a func that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local imap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
    end

    local telescope_builtin = require('telescope.builtin')

    if not vim.fn.has('nvim-0.11') then
        -- nvim stable
        nmap('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('gra', vim.lsp.buf.code_action, '[C]ode [A]ction')
        imap('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')
    else
        -- nvim nightly
        if client.supports_method(methods.textDocument_completion) then
            vim.lsp.completion.enable(
                true,
                client.id,
                bufnr,
                { autotrigger = false }
            )
        end
    end

    nmap('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- use `telescope_builtin.lsp_*` instead of default lsp methods
    nmap(
        'grr',
        telescope_builtin.lsp_references,
        '[G]oto [R]eferences by telescope'
    )
    nmap(
        'gd',
        telescope_builtin.lsp_definitions,
        '[G]oto [D]efinitions by telescope'
    )
    nmap(
        'grt',
        telescope_builtin.lsp_type_definitions,
        '[G]oto Type Definitions by telescope'
    )
    nmap(
        'gI',
        telescope_builtin.lsp_implementations,
        '[G]oto [I]mplementations by telescope'
    )

    nmap('gO', function()
        telescope_builtin.lsp_document_symbols({
            symbols = {
                'namespace',
                'class',
                'struct',
                'enum',
                'function',
                'method',
                'field',
                'constructor',
            },
        })
    end, '[G]oto [I]mplementations by telescope')

    nmap('gH', vim.lsp.buf.typehierarchy, '[G]oto type [H]ierarchy')

    -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinitions')
    -- nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

    nmap('<A-i>', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, 'Toggle inlay hint')

    nmap('<A-v>', function()
        vim.diagnostic.config({
            virtual_lines = not vim.diagnostic.config().virtual_lines,
        })
    end, 'Toggle virtual lines')

    nmap('[D', function()
        vim.diagnostic.jump({
            count = -vim.v.count1,
            severity = vim.diagnostic.severity.ERROR,
            wrap = false,
        })
    end, 'Jump to the previous Error diagnostic')

    nmap(']D', function()
        vim.diagnostic.jump({
            count = vim.v.count1,
            severity = vim.diagnostic.severity.ERROR,
            wrap = false,
        })
    end, 'Jump to the next Error diagnostic')

    vim.diagnostic.config({
        virtual_text = {
            source = 'if_many',
            current_line = true,
        },
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '',
                [vim.diagnostic.severity.WARN] = '',
                [vim.diagnostic.severity.HINT] = '',
                [vim.diagnostic.severity.INFO] = '',
            },
            numhl = {
                [vim.diagnostic.severity.WARN] = 'WarningMsg',
                [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
                [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
            },
        },
        severity_sort = true,
    })

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end
