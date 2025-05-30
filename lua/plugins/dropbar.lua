return {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    opts = {
        icons = {
            enable = false,
            ui = {
                bar = {
                    separator = '|',
                },
            },
        },
    },
}
