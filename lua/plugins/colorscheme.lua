return {
    {
        'sainnhe/sonokai',
        priority = 1000,
        config = function()
            vim.g.sonokai_style = 'espresso'
            vim.g.sonokai_disable_italic_comment = 1
        end,
    },
    {
        'rebelot/kanagawa.nvim',
        lazy = true,
        opts = {
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
            statementStyle = { bold = true },
            dimInactive = true,
            theme = 'wave',
            background = {
                dark = 'wave',
                light = 'lotus',
            },
        },
    },
    { 'sainnhe/everforest', lazy = true },
    {
        'daschw/leaf.nvim',
        lazy = true,
        opts = {
            contrast = 'medium',
            overrides = {
                ColorColumn = {
                    link = 'CursorLine',
                },
            },
        },
    },
    { 'JoosepAlviste/palenightfall.nvim', lazy = true },
    { 'Yazeed1s/oh-lucy.nvim', lazy = true },
    { 'AlexvZyl/nordic.nvim', lazy = true },
    { 'olivercederborg/poimandres.nvim', lazy = true },
    { 'nvimdev/zephyr-nvim', lazy = true },
    { 'EdenEast/nightfox.nvim', lazy = true },
    { 'nyoom-engineering/oxocarbon.nvim', lazy = true },
    { 'antonk52/lake.nvim', lazy = true },
    { 'xero/miasma.nvim', lazy = true },
    {
        'ribru17/bamboo.nvim',
        lazy = true,
        opts = {
            style = 'vulgaris', -- 'vulgaris' (regular) / 'multiplex' (greener)
            code_style = {
                conditionals = 'none',
            },
        },
    },
    { 'projekt0n/caret.nvim', lazy = true },
}
