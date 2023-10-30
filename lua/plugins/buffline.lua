require("bufferline").setup {
    options = {
        close_command = "bdelete! %d",
        mode = 'buffers',
        offsets = {
            {
                filetype = "neo-tree",
                --text = "NVim", -- "File Explorer",
                separator = false,
                separator_style = "thin",
                padding = 0
            }
        },
        diagnostics = "nvim_lsp",
        indicator = {
            icon = '', -- this should be omitted if indicator style is not 'icon'
            style = 'none'
        },
        padding = 0,
        color_icons = true,
        separator = false,
        separator_style = "thin",
        buffer_close_icon = "x",
        close_icon = '',
        --move_wraps_at_ends = false,


    }
}
