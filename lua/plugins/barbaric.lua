if vim.loop.os_uname().sysname == 'Linux' then
    return {
        'rlue/vim-barbaric',
        config = function()
            vim.g.barbaric_ime = 'fcitx'
        end,
    }
else
    return {}
end
