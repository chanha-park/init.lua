local input_methods = { 'ibus', 'fcitx', 'kime' }
local input_method = nil

for _, im in ipairs(input_methods) do
    if vim.fn.executable(im) then
        input_method = im
        break
    end
end

if not input_method then
    return {}
end

if vim.uv.os_uname().sysname == 'Linux' then
    return {
        'rlue/vim-barbaric',
        config = function()
            vim.g.barbaric_ime = input_method
        end,
    }
else
    return {}
end
