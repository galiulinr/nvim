require("bufferline").setup {
    options = {
        close_command = "bdelete! %d",
        mode = 'buffers',
        offsets = {
            {
                filetype = "neo-tree",
                text = "NVim", -- "File Explorer",
                separator = true,
                separator_style = "thin",
                padding = 1
            }
        },
        diagnostics = "nvim_lsp",
        indicator = {
            icon = '', -- this should be omitted if indicator style is not 'icon'
            style = 'none'
        },
        color_icons = true,
        separator_style = "thin",
        buffer_close_icon = "x",
        close_icon = '',


    }
}
