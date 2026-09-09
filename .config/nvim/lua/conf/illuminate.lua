require('illuminate').configure({
    providers = {
        'lsp',
        'regex',
    },
    delay = 100,
    filetypes_denylist = {
        'md',
    },
})
